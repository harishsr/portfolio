When /^I log in as "(.+)"$/ do |username|
  admin = Admin.where(username: username).first
  admin ||= FactoryGirl.create(:admin, username: username)

  step %{I go to the admin login}
  fill_in "admin_username", with: admin.username
  fill_in "admin_password", with: admin.password
  click_button "Log in"

  @current_admin = admin
end

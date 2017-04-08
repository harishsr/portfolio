Given /^"(.+)" has an entry titled "(.+)" with content "(.+)"$/ do |username, title, content|
  admin = Admin.where(username: username).first
  admin ||= FactoryGirl.create :admin, username: username

  FactoryGirl.create :entry, admin: admin, title: title, content: content
end

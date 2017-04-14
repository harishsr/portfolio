Given /^"(.+)" has an entry titled "(.+)" with content "(.+)"$/ do |username, title, content|
  admin = Admin.where(username: username).first
  admin ||= FactoryGirl.create :admin, username: username

  FactoryGirl.create :entry, admin: admin, title: title, content: content
end

When /^I attach a valid image$/ do
  file = File.join(Rails.root, 'test/files/valid_image.jpeg')
  attach_file :entry_image, file
end

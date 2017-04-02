Given /^I should see "(.*)"$/ do |content|
    assert_match content, page.html
end

Given /^I should not see "(.*)"$/ do |content|
    refute_match content, page.html
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, content|
    fill_in field, with: content
end

When /^I select "([^"]*)" from "([^"]*)"$/ do |selection, field|
    select selection, from: field
end

When /^I press "([^"]*)"$/ do |button|
    click_button button
end

When /^I follow "([^"]*)"$/ do |link|
    click_link link
end

Given /^I pry in$/ do
    binding.pry
end

Given /^I add a group named "([^"]*)"$/ do |group_name|
  click_link "Groups"
  click_link "New"
  fill_in :name, with: group_name
  click_button "Create Group"
end

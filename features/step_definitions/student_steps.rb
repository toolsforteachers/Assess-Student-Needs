Given /^I add two students to the group "([^"]*)"$/ do |group_name|
  click_link "Students"
  click_link "New"
  fill_in :name, with: 'Ann A.'
  click_button 'Create Student'
  click_link "New"
  fill_in :name, with: 'Bob B.'
  click_button 'Create Student'
end
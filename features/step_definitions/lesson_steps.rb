Given /^I add a lesson "([^"]*)" for "([^"]*)"$/ do |lesson_name, group_name|
  click_link "Lesson"
  click_link "New"
  select(group_name, from:'Group')
  fill_in(:name, with: lesson_name)
  click_button "Create Lesson"
end

Given /^I change the lesson name to "([^"]*)"$/ do |new_name|
  click_link "Edit"
  fill_in(:name, with: new_name)
  click_button "Update Lesson"
end
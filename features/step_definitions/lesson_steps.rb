Given /^I add a lesson "([^"]*)" for "([^"]*)"$/ do |lesson_name, group_name|
  click_link "Lesson"
  click_link "New"
  select(group_name, from:'Group')
  fill_in(:name, with: lesson_name)
  click_button "Create Lesson"
end

Given /^I edit the lesson name to "([^"]*)"$/ do |new_name|
  click_link "Edit"
  fill_in(:name, with: new_name)
  click_button "Update Lesson"
end

When /^I go to the lesson page for "([^"]*)"$/ do |lesson_name|
  visit lesson_path(Lesson.find_by_name(lesson))
end

Then /^the lesson "([^"]*)" should have (\d+) students$/ do |lesson_name, amount|
  Lesson.find_by_name(lesson_name).students.length.should == amount.to_i
end

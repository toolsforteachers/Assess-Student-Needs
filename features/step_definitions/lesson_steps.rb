Given /^I add a lesson "([^"]*)" for "([^"]*)"$/ do |lesson_name, group_name|
  click_link "Lessons"
  click_link "New"
  select(group_name, from:'Group')
  fill_in('Objective', with: lesson_name)
  fill_in('Date', with: 1.day.ago)
  click_button "Create Lesson"
end

Given /^I edit the lesson objective to "([^"]*)"$/ do |new_name|
  click_link "Edit"
  fill_in('Objective', with: new_name)
  click_button "Update Lesson"
end

When /^I go to the lesson page for "([^"]*)"$/ do |lesson_name|
  visit lesson_path(Lesson.find_by_name(lesson))
end

Then /^the lesson "([^"]*)" should have (\d+) students$/ do |lesson_name, amount|
  Lesson.find_by_name(lesson_name).students.length.should == amount.to_i
end

When /^I add "([^"]*)" to the lesson "([^"]*)"$/ do |student_name, lesson_name|
  click_link('Add Student')
  fill_in('Name', with: student_name)
  click_button('Create Student')
end

When /^I should be on the lesson page for "([^"]*)"$/ do |lesson_name|
  page.current_path.should include("/lessons/#{ Lesson.find_by_name(lesson_name).id }")
end

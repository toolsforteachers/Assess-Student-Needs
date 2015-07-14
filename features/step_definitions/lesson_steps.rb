Given /^I add a lesson "([^"]*)" for "([^"]*)" with indicator "([^"]*)"$/ do |lesson_name, group_name, indicator|
  click_link group_name
  click_link "Add Lesson"
  step %(I should see lesson specific fields)
  select(indicator, from: 'Assessment Indicator')
  fill_in('Objective', with: lesson_name)
  fill_in('Date', with: 1.day.ago)
  click_button "Create"
end

Given /^I edit the lesson objective from "([^"]*)" to "([^"]*)"$/ do |old_name, new_name|
  click_link "Edit Details"
  fill_in('Objective', with: new_name)
  click_button "Update"
end

When /^I go to the lesson page for "([^"]*)"$/ do |lesson_name|
  visit lesson_path(Lesson.find_by_name(lesson))
end

Then /^the lesson "([^"]*)" should have (\d+) students$/ do |lesson_name, amount|
  Assessment.find_by_name(lesson_name).students.length.should == amount.to_i
end

When /^I add "([^"]*)" to the lesson "([^"]*)"$/ do |student_name, lesson_name|
  assessment = Assessment.find_by_name(lesson_name)
  group = assessment.group
  click_link('** Students **')
  click_link('New Student')
  fill_in('Name', with: student_name)
  click_button('Create Student')
  click_link(group.name)
  click_link(lesson_name)
  click_link("Edit Details")
  fill_in('Objective', with: lesson_name)
  check(student_name)
  click_button "Update"
end

When /^I should be on the lesson page for "([^"]*)"$/ do |lesson_name|
  page.current_path.should include("/assessments/#{ Lesson.find_by_name(lesson_name).id }")
end

When /^I assign this lesson to level (\d+), indicator "([^"]*)"$/ do |level, indicator|
  Fabricate(:indicator, name: indicator, level: level)
  select("(Level: #{ level }) #{ indicator }",)
end

When /^I choose "(.*?)" and "(.*?)" and press the update button$/ do |level, strand|
  select(level, :from => "assessment_level")
  select(strand, :from => "assessment_key")
  click_link('Update indicator list')
end

When /^I choose "(.*?)" from the indicator list$/ do |indicator_name|
  select(indicator_name, :from => "assessment_indicator_id")
end

Then /^I should( not)? see lesson specific fields$/ do |negate|
  within(:css, '.page-header') do
    if negate
      text.should have_content('Judgement')
      text.should_not have_content('Lesson')
    else
      text.should_not have_content('Judgement')
      text.should have_content('Lesson')
    end
  end

  within(:css, '#assessment_details') do
    if negate
      text.should_not have_content('Date')
      text.should_not have_content('Objective')
      text.should have_content('Notes')
    else
      text.should have_content('Date')
      text.should have_content('Objective')
      text.should_not have_content('Notes')
    end
  end
end

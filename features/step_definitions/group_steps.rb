Given(/^I add a group named "(.*?)" with a student named "(.*?)"$/) do |group_name, student_name|
  visit new_group_path
  fill_in 'Class name', with: group_name
  click_link 'Add a student'
  select 'Maths', from: 'Subject'
  fill_in 'Student', with: 'Ann'
  click_button "Save"
end

When(/^I navigate to the "(.*?)" group page$/) do |group_name|
  click_link "Classes"
  click_link group_name
end

When /^the "(.*)" group should have (\d+) students$/ do |group_name, count|
  Group.find_by_name(group_name).students.length.should eql(count.to_i)
end

Then(/^the "(.*?)" group should subject "(.*?)"$/) do |group_name, subject_name|
  Group.find_by_name(group_name).subject.name.should eql(subject_name)
end

Then(/^I should see "(.*?)" in the list of students$/) do |list_of_student_names|
  click_link 'Students'
  within('table.students') do
    list_of_student_names.split(',').each do |student_name|
      page.should have_text(student_name)
    end
  end
end

When(/^I the follow the add lesson link$/) do
  click_link 'Lessons'
  click_link('Add a new lesson')
end

Then(/^I should be the teacher of "(.*?)"$/) do |group_name|
  within(:css, 'h1') do
    page.should have_text(group_name)
  end
end

When(/^I edit the group "(.*?)"$/) do |group_name|
  visit edit_group_path(Group.find_by_name(group_name))
end

When(/^I remove the student named "(.*?)"$/) do |student_name|
  click_link "Remove #{ student_name }"
  click_button 'Save'
end

Given(/^I add a group named "(.*?)" with a student named "(.*?)"$/) do |group_name, student_name|
  visit new_group_path
  fill_in 'Class name', with: group_name
  click_link 'Add a student'
  fill_in 'Student', with: 'Ann'
  click_button "Save"
end

When(/^I choose "(.*?)" from the groups dropdown$/) do |group_name|
  within(:css, 'ul.teacher-groups') do
    click_link(group_name)
  end
end

When /^the "(.*)" group should have (\d+) students$/ do |group_name, count|
  Group.find_by_name(group_name).students.length.should eql(count.to_i)
end

Then(/^I should see "(.*?)" in the list of students$/) do |list_of_student_names|
  list_of_student_names.split(',').each do |student_name|
    page.should have_css('tr.student', text: student_name)
  end
end

When(/^I the follow the add lesson link$/) do
  within(:css, 'li.add-lesson') do
    click_link('Lesson')
  end
end

When(/^I follow the teacher judgement link$/) do
  within(:css, 'li.add-judgement') do
    click_link('Teacher judgement')
  end
end

Then(/^I should be the teacher of "(.*?)"$/) do |group_name|
  within(:css, 'h1') do
    page.should have_text(group_name)
  end
end

When(/^I edit the group "(.*?)"$/) do |group_name|
  visit edit_group_path(Group.find_by_name(group_name))
end

When(/^I remove the student$/) do
  click_link 'Remove'
  click_button 'Save'
end

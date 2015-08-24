Given(/^"(.*?)" has been marked against two objectives$/) do |student_name|
  student = Student.find_by(name: student_name)
  indicator_1 = Indicators::Objective.first
  indicator_2 = Indicators::Objective.last

  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 3, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 4, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_2, mark: 4, out_of: 5)
end

When(/^I visit the student page for "(.*?)"$/) do |student_name|
  click_link "Year 6A"
  within('.students') do
    click_link student_name
  end
end

Then(/^I should see (\d+) activity records$/) do |activity_record_count|
  page.should have_css('.activity', count: activity_record_count)
end

Then(/^I should (\d+) indicator progress records$/) do |progress_record_count|
  click_link 'Year 1'
  page.should have_css('.indicator-progress', count: progress_record_count)
end

When(/^I add the students "(.*?)" to "(.*?)"$/) do |student_list, group_name|
  group = Group.find_by(name: group_name)
  visit group_path(group)
  click_link 'Manage students'

  student_list.split(',').each do |student_name|
    click_link 'Add a student'
    within(all('.fields').last) do
      fill_in 'Student', with: student_name
    end
  end
  click_button "Save"
end

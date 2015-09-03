Given(/^"(.*?)" has been marked against two objectives$/) do |student_name|
  student = Student.find_by(name: student_name)
  indicator_1 = CurriculumService.primary.leaves.first
  indicator_2 = CurriculumService.primary.leaves.last

  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 3, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 4, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_2, mark: 4, out_of: 5)
end

Given(/^"(.*?)" has been marked against one pedagogy$/) do |student_name|
  student = Student.find_by(name: student_name)
  indicator = Indicators::Pedagogy.first.leaves.first
  Fabricate(:assessment, student: student, indicator: indicator, mark: 3, out_of: 5)
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

Then(/^I should see (\d+) indicator progress records for "(.*?)"$/) do |progress_record_count, indicator_name|
  click_link indicator_name
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

Then(/^I should see student tabs for "(.*?)"$/) do |tab_titles|
  within('ul.student.nav-tabs') do
    tab_titles.split(',').each do |tab_title|
      page.should have_text(tab_title)
    end
  end
end

Given(/^"(.*?)" has been marked against two objectives$/) do |student_name|
  student = Student.find_by(name: student_name)
  indicator_1 = Indicators::Objective.first
  indicator_2 = Indicators::Objective.last

  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 3, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_1, mark: 4, out_of: 5)
  Fabricate(:assessment, student: student, indicator: indicator_2, mark: 4, out_of: 5)
end

When(/^I visit the progress page for "(.*?)"$/) do |student_name|
  click_link "Year 6A"
  click_link student_name
end

Then(/^I should see (\d+) assessment records$/) do |assessment_record_count|
  page.should have_css('.assessment', count: assessment_record_count)
end

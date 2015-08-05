When /^I record a score of (\d+) for "([^"]*)" for "([^"]*)"$/ do |score, student_name, indicator_name|
  student = Student.find_by_name(student_name)

  within(:css, "tr#student_#{ student.id }") do
    select(indicator_name, from: 'assessment_indicator_id')
    find("#assessment_score_#{ score }").trigger('click')
    click_button("Save")
  end
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, level_name|
  student = Student.find_by_name(student_name)

  within(:css, "tr#student_#{ student.id }") do
    find_field("assessment_score_#{ ticks }").should be_checked
  end
end

When(/^"(.*?)" already has a score of (\d+) for "(.*?)"$/) do |student_name, score, indicator_name|
  indicator = Indicator.find_by(name: indicator_name)
  student = Student.find_by(name: student_name)
  Fabricate(:assessment, score: score,
    indicator: indicator, student: student)
end

Then(/^I should see (\d+) for the last attempt by "(.*?)"$/) do |score, student_name|
  student = Student.find_by_name(student_name)
save_and_open_page
  within(:css, "tr#student_#{ student.id } td.attempt") do
    page.should have_text("L #{ score }")
  end
end

When /^I record a score of (\d+) for "([^"]*)" for "([^"]*)"$/ do |score, student_name, indicator_name|
  student = Student.find_by_name(student_name)

  within(:css, "table#student_#{ student.id }") do
    select(indicator_name, from: 'assessment_indicator_id')
    choose("assessment_score_#{ score }")
    fill_in('assessment_name', with: 'A note')
    click_button("Save")
  end
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, level_name|
  student = Student.find_by_name(student_name)

  within(:css, "table#student_#{ student.id }") do
    find_field("assessment_score_#{ ticks }").should be_checked
  end
end

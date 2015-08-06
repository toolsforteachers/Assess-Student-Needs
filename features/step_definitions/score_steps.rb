When /^I record a score of (\d+) for "([^"]*)" for "([^"]*)"$/ do |score, student_name, indicator_name|
  student = Student.find_by_name(student_name)

  within(:css, "tr#student_#{ student.id }") do
    click_link 'Unscored'
    choose(indicator_name)
    find("#assessment_score_#{ score }").trigger('click')
    fill_in 'Notes', with: 'some text'
    click_button("Save")
  end
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, level_name|
  student = Student.find_by_name(student_name)
  within(:css, "tr#student_#{ student.id }") do
    page.should have_text("Score: #{ ticks }")
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

  within(:css, "tr#student_#{ student.id }") do
    click_link "Score"
    sleep 1.second
    page.should have_text("(L #{ score })")
  end
end

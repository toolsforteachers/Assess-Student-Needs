When /^I record a score of (\d+) for "([^"]*)" for "([^"]*)"$/ do |score, student_name, indicator_name|
  student = Student.find_by_name(student_name)
  indicator = Indicator.find_by(name: indicator_name)

  within("#student_#{ student.id }", match: :first) do
    click_link('n/a')
    select(score)
  end
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, indicator_name|
  indicator = Indicator.find_by(name: indicator_name)
  student = Student.find_by_name(student_name)

  within("tr#student_#{ student.id } td.score_#{ ticks.to_i * 20 }") do
    page.should have_text(ticks)
  end
end

When(/^"(.*?)" already has a mark of (\d+) out of (\d+) for "(.*?)"$/) do |student_name, mark, out_of, indicator_name|
  indicator = Indicator.find_by(name: indicator_name)
  student = Student.find_by(name: student_name)

  Fabricate(:assessment, mark: mark, out_of: out_of,
    indicator: indicator, student: student)
end

Then(/^I should see (\d+) for the last attempt by "(.*?)"$/) do |score, student_name|
  student = Student.find_by_name(student_name)

  within all("tr#student_#{ student.id }")[1] do
    page.should have_text("L #{ score }")
  end
end

When(/^I record a notes of "(.*?)" for "(.*?)" for "(.*?)"$/) do |notes, student_name, indicator_name|
  student = Student.find_by_name(student_name)
  indicator = Indicator.find_by(name: indicator_name)

  within("#student_#{ student.id }", match: :first) do
    click_link('Empty')
    text_area = first(:css, 'textarea.input-large').native
    text_area.send_keys(notes)
    find('button.editable-submit').click
  end
end

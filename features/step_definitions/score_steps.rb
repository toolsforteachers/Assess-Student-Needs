When /^I record a score of (\d+) for "([^"]*)" for "([^"]*)"$/ do |score, student_name, indicator_name|
  student = Student.find_by_name(student_name)
  indicator = Indicator.find_by(name: indicator_name)

  click_link("student_#{ student.id }_indicator_#{ indicator.id }_glyph")
  find("#assessment_mark_#{ score }").trigger('click')
  fill_in 'Notes', with: 'some text'
  click_button("Save")
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, indicator_name|
  indicator = Indicator.find_by(name: indicator_name)
  student = Student.find_by_name(student_name)

  within(:css, "td#student_#{ student.id }_indicator_#{ indicator.id }_score") do
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

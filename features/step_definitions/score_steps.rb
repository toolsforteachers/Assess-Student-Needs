When /^I record a score of (\d+) for "([^"]*)"$/ do |score, student_name|
  student = Student.find_by_name(student_name)
  within(:css, "tr#student_score_#{ student.id }") do
    select(score, from: 'lesson_student_score')
    fill_in('lesson_student_notes', with: 'A note')
    click_button("Save")
  end
end

Then /^I should see "([^"]*)" has (\d+) ticks for "([^"]*)"$/ do |student_name, ticks, level_name|
  student = Student.find_by_name(student_name)
  within(:css, "tr#student_score_#{ student.id }") do
    text.should have_content("#{ ticks } ticks")
    text.should have_content("A note")
  end
end


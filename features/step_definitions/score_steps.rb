When /^I record a score of (\d+) for "([^"]*)"$/ do |score, student_name|
  student = Student.find_by_name(student_name)
  within(:css, "tr#student_score_#{ student.id }") do
    fill_in 'lesson_student_score', :with => score
    click_button "Save"
  end
end

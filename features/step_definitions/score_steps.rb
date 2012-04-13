When /^I record a score of (\d+) for "([^"]*)"$/ do |amount, student_name|
  student = Student.find_by_name(student_name)
  fill_in "student_score_#{ student.id }", with: amount
end

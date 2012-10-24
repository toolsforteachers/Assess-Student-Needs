Given /^I am the teacher$/ do
  @teacher ||= Fabricate(:teacher)
  visit '/teachers/sign_in'
  fill_in "teacher_email", :with => @teacher.email
  fill_in "teacher_password", :with => @teacher.password
  click_button "Sign in"
end

Given /^I am the teacher of "([^"]*)" with students "([^"]*)"$/ do |group_name, student_names|
  step "I am the teacher"
  students = student_names.split(",").map{ |name| Fabricate(:student, name: name) }
  @group = Fabricate(:group, name: group_name, students: students)
  visit "/"
end

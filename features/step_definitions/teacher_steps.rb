Given /^I am the teacher$/ do
  @teacher ||= Fabricate(:teacher)
  visit '/teachers/sign_in'
  fill_in "teacher_email", :with => @teacher.email
  fill_in "teacher_password", :with => @teacher.password
  click_button "Sign in"
end

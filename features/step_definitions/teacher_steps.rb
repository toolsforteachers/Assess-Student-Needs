Given /^I am the teacher$/ do
  @teacher ||= Fabricate(:teacher, name: 'Toby P.',
      password: 'foo-bar', password_confirmation: 'foo-bar')
  visit '/teachers/sign_in'
  fill_in "teacher_email", :with => @teacher.email
  fill_in "teacher_password", :with => 'foo-bar'

  click_button "Sign in"
end

Given /^I am the teacher of "([^"]*)" with students "([^"]*)"$/ do |group_name, student_names|
  step "I am the teacher"
  group = Fabricate(:group, name: group_name, teacher: Teacher.last)
  student_names.split(",").each do |name|
    Fabricate(:student, name: name, group: group)
  end
  visit "/"
end

When(/^I edit my profile$/) do
  click_link 'Edit profile'
  fill_in 'Name', with: 'Jim Bobb'
  fill_in 'Email', with: 'jimbobb@example.com'
  fill_in 'Current password', with: 'foo-bar'
  click_button 'Save'
end

Then(/^my name should display as "(.*?)"$/) do |name|
  within('ul.teacher-links') do
    page.should have_text(name)
  end
end

Then(/^my email should be "(.*?)"$/) do |email|
  @teacher.reload.email.should eql(email)
end

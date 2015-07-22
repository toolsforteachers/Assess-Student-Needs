Given /^I add a judgement for "([^"]*)" with indicator "([^"]*)"$/ do |group_name, indicator|
  group = Group.find_by(name: group_name)
  visit new_group_assessment_path(group, type_helper: 'TeacherJudgement')
  step %(I should not see lesson specific fields)
  select(indicator, from: 'Assessment Indicator')
  click_button "Create"
end

Then(/^I should see the new teacher judgement form$/) do
   page.should have_css('form#new_assessment')
end

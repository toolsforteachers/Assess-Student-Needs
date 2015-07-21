Given /^I add a judgement for "([^"]*)" with indicator "([^"]*)"$/ do |group_name, indicator|
  visit group_path(Group.find_by(name: group_name))
  click_link "Add Teacher Judgement"
  step %(I should not see lesson specific fields)
  select(indicator, from: 'Assessment Indicator')
  click_button "Create"
end

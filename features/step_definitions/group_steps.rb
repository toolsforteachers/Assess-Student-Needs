Given /^I add a group named "([^"]*)"$/ do |group_name|
  click_link "New Group"
  fill_in :name, with: group_name
  click_button "Create Group"
end

When /^the "([^"]*)" group should have (\d+) students$/ do |group_name, count|
  Group.find_by_name(group_name).students.length.should eql(count.to_i)
end
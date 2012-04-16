Given /^I add a group named "([^"]*)"$/ do |group_name|
  click_link "Groups"
  click_link "New"
  fill_in :name, with: group_name
  click_button "Create Group"
end

When /^the "([^"]*)" group should have (\d+) students$/ do |group_name, count|
  Group.find_by_name(group_name).students.length.should eql(count.to_i)
end

When /^I should be on the students page for "([^"]*)"$/ do |group_name|
  page.current_path.should include("/groups/#{ Group.find_by_name(group_name).id }/students")
end

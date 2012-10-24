Given /^I add a group named "(.*?)" with two students$/ do |group_name|
  Student.create name: 'Ann'
  Student.create name: 'Bob'
  click_link "New Group"
  fill_in :name, with: group_name
  check("An")
  check("Bob")
  click_button "Create Group"
end

When /^the "([^"]*)" group should have (\d+) students$/ do |group_name, count|
  Group.find_by_name(group_name).students.length.should eql(count.to_i)
end
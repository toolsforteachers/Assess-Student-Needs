Given(/^I add a new lesson for "(.*?)"$/) do |group_name|
  Fabricate(:indicator, name: 'bar')
  Fabricate(:indicator, name: 'foo')

  group = Group.find_by(name: group_name)
  visit new_group_lesson_path(group)

  fill_in('Goal', with: 'Do stuff')
  select 'foo', from: 'Objective'
  click_link 'Add an objective'
  within(page.all(:css, '.well.objective').last) do
    select 'bar', from: 'Objective'
  end
  click_button "Save"
end

Then(/^the lesson should have (\d+) objectives$/) do |objective_count|
  page.should have_css('.well.objective', count: objective_count)
end

Then(/^the lesson name should be "(.*?)"$/) do |lesson_name|
  within('h3') do
    page.should have_text(lesson_name)
  end
end

Then(/^I should see the new lesson form$/) do
  page.should have_css('form#new_lesson')
end

When(/^I edit the lesson$/) do
  click_link('Edit lesson')
  within(page.all(:css, '.well.objective').last) do
    click_link('Remove')
  end
  fill_in('Goal', with: 'new goal')
  click_button "Save"
end

Given /^I add a lesson "([^"]*)" for "([^"]*)" with indicators "([^"]*)"$/ do |lesson_name, group_name, indicator_names|
  group = Group.find_by(name: group_name)
  lesson = Fabricate(:lesson, group: group, name: lesson_name)

  indicator_names.split(',').each do |indicator_name|
    indicator = Indicator.find_by(name: indicator_name)
    Fabricate(:objective, lesson: lesson, indicator: indicator)
  end

  visit group_lesson_path(group, lesson)
end

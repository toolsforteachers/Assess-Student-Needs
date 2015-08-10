Given(/^"(.*?)" is studying "(.*?)"$/) do |group_name, subject_name|
  subject = Indicators::Subject.find_by(name: subject_name)
  group = Group.find_by(name: group_name)
  group.update_attributes subject: subject
end

Given(/^I add a new lesson for "(.*?)"$/) do |group_name|
  group = Group.find_by(name: group_name)
  visit new_group_lesson_path(group)
  fill_in('Notes', with: 'Do stuff')
  select 'foo', from: 'Objective'
  click_link 'Add an objective'
  within(page.all(:css, '.well.objective').last) do
    select 'bar', from: 'Objective'
  end
  click_button "Save"
end

Then(/^the lesson should have (\d+) objectives$/) do |objective_count|
  if objective_count.to_i > 1
    page.should have_css('.panel.objective', count: objective_count)
    page.should have_css('.objective .panel-heading', text: 'Stream 1')

  end
  page.should have_css('td', text: "Level", count: objective_count)
  page.should have_css('td', text: "Topic", count: objective_count)
  page.should have_css('td', text: "Objective", count: objective_count)
end

Then(/^the lesson notes should be "(.*?)"$/) do |lesson_notes|
  page.should have_text("Notes: #{ lesson_notes }")
end

Then(/^I should see the new lesson form$/) do
  page.should have_css('form#new_lesson')
end

When(/^I edit the lesson$/) do
  click_link('Edit lesson')
  within(page.all(:css, '.well.objective').last) do
    click_link('Remove')
  end
  fill_in('Notes', with: 'new goal')
  click_button "Save"
end

Given /^I add a lesson "([^"]*)" for "([^"]*)" with indicators "([^\"]*)" as "([^\"]*)"$/ do |lesson_notes, group_name, indicator_names, objective_names|
  group = Group.find_by(name: group_name)
  lesson = Fabricate(:lesson, group: group, notes: lesson_notes)

  indicator_names.split(',').each_with_index do |indicator_name, index|
    indicator = Indicator.find_by(name: indicator_name)
    Fabricate(:objective, lesson: lesson, indicator: indicator,
      stream: objective_names.split(',')[index])
  end

  visit group_lesson_path(group, lesson)
end

Then(/^I should see "(.*?)" in the "(.*?)" section$/) do |student_name, section_name|
  within('.panel', text: section_name) do
    page.should have_text(student_name)
  end
end

When(/^I try to add a lesson I should instead edit "(.*?)"$/) do |group_name|
  visit groups_path
  click_link "Year 6A"
  click_link "Add a new lesson"

  page.should have_text('To add objectives, you should first')
  click_link "choose a subject"

  select 'Maths', from: 'Subject'
  click_button "Save"
end

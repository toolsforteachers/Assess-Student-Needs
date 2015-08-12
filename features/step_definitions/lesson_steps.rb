Given(/^"(.*?)" is studying "(.*?)"$/) do |group_name, subject_name|
  subject = Indicators::Subject.find_by(name: subject_name)
  group = Group.find_by(name: group_name)
  group.update_attributes subject: subject
end

Given(/^I add a new "(.*?)" lesson for "(.*?)"$/) do |subject_name, group_name|
  setup_maths_indicators

  group = Group.find_by(name: group_name)
  visit new_group_lesson_path(group)
  fill_in('Notes', with: 'Do stuff')
  select(subject_name, from: 'Subject')
  click_button "Save"
end

When(/^I add two objectives to that lesson$/) do
  within(page.all(:css, '.well.objective').first) do
    fill_in 'Stream', with: 'Foxes'
    select 'Year 2', from: 'Level'
    select 'Numbers', from: 'Topic'
    select 'Addition and subtraction'
  end

  click_link 'Add an objective'

  within(page.all(:css, '.well.objective').last) do
    fill_in 'Stream', with: 'Owls'
    select 'Year 3', from: 'Level'
    select 'Numbers', from: 'Topic'
    select 'Advanced addition and subtraction'
  end
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
  page.should have_css('tr.lesson-notes', lesson_notes)
end

Then(/^the lesson teacher should be "(.*?)"$/) do |teacher_name|
  page.should have_css('tr.lesson-teacher', teacher_name)
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
  within('section', text: section_name) do
    page.should have_text(student_name)
  end
end

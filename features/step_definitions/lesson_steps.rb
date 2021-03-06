Given(/^I add a new "(.*?)" lesson for "(.*?)"$/) do |subject_name, group_name|
  group = Group.find_by(name: group_name)
  visit group_path(group)
  click_link 'Add a new lesson', match: :first
  fill_in('Notes', with: 'Do stuff')
  choose('Teacher judgement')
  click_button "Save"
end

When(/^I add two objectives to that lesson$/) do
  within(page.all(:css, '.well.objective').first) do
    click_link 'Maths'
    click_link 'Level: Year 1'
    click_link 'Topic: Number'
    click_link 'Prompt: Student will'
    click_link 'Select'
  end

  click_link 'Add objective'

  within(page.all(:css, '.well.objective').last) do
    click_link 'Maths'
    click_link 'Level: Year 2'
    click_link 'Topic: Number'
    click_link 'Select'
  end
end

Then(/^the lesson should have streams titled "(.*?)"$/) do |streams|
  streams.split(',').each do |stream|
    page.should have_css('.panel.objective', text: "#{ stream } objective")
  end
end

Then(/^the lesson should have (\d+) streams$/) do |count|
  page.should have_css('.panel.objective', count: count)
end

When(/^I remove the first objective$/) do
  click_link 'Edit lesson'

  within '.objective', match: :first do
    click_link 'Remove'
  end
  click_button 'Save'
end

When(/^I change the first objective name to "(.*?)"$/) do |new_name|
  click_link 'Edit lesson'
  fill_in('lesson_objectives_attributes_0_stream', with: new_name )
  click_button 'Save'
end

Then(/^the lesson notes should be "(.*?)"$/) do |lesson_notes|
  page.should have_css('.lesson-notes', lesson_notes)
end

Then(/^the lesson teacher should be "(.*?)"$/) do |teacher_name|
  page.should have_css('.lesson-teacher', teacher_name)
end

Then(/^the lesson evidenced mode should be "(.*?)"$/) do |evidenced_as|
  page.should have_css('.lesson-evaluation', evidenced_as)
end

Then(/^I should see the new lesson form$/) do
  page.should have_css('form#new_lesson')
end

Given /^I add a lesson "([^"]*)" for "([^"]*)" with indicators "([^\"]*)"$/ do |lesson_notes, group_name, indicator_names|
  group = Group.find_by(name: group_name)
  lesson = Fabricate(:lesson, group: group, notes: lesson_notes)

  indicator_names.split(',').each_with_index do |indicator_name, index|
    indicator = Indicator.find_by(name: indicator_name)
    Fabricate(:objective, lesson: lesson, indicator: indicator)
  end

  visit group_lesson_path(group, lesson)
end

Then(/^I should see "(.*?)" in the "(.*?)" section$/) do |student_name, section_name|
  within('.panel.objective', text: section_name) do
    page.should have_text(student_name)
  end
end

Then(/^I should not see "(.*?)" in the "(.*?)" section$/) do |student_name, section_name|
  within('.panel.objective', text: section_name) do
    page.should_not have_text(student_name)
  end
end

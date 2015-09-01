When(/^I add a pedadogy "(.*?)"$/) do |pedagogy_name|
  visit new_indicators_pedagogy_path
  fill_in 'Pedagogy', with: pedagogy_name
  click_button 'Save'
end

When(/^I add a learning attribute "(.*?)"$/) do |learning_attribute_name|
  click_link 'Add a new Learning attribute'
  fill_in 'Learning attribute', with: learning_attribute_name
  click_button 'Save'
end

When(/^I add a learning skill "(.*?)"$/) do |learning_skill_name|
  click_link 'Add a new Learning skill'
  fill_in 'Learning skill', with: learning_skill_name
  click_button 'Save'
end

When(/^I visit the pedagogies page$/) do
  click_link 'Pedagogies'
end

When(/^I add a pedagogy objective "(.*?)"$/) do |objective_name|
  click_link "Add a new Objective"
  fill_in "Objective", with: objective_name
  click_button 'Save'
end

Then(/^I should see "(.*?)" as the pedagogy objective$/) do |objective_name|
  page.should have_css('.objective', text: objective_name)
end

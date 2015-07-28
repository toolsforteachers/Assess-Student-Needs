When(/^I visit the indicators page$/) do
  visit indicators_path
end

When(/^I add a subject "(.*?)"$/) do |subject_name|
  click_link 'Add a new subject'
  fill_in 'Subject', with: subject_name
  click_button 'Save'
  page.should have_text('Subject was successfully created')
end

Then(/^I should be on the indicator page for "(.*?)"$/) do |indicator_name|
  within(:css, '.indicator-form') do
    page.should have_text(indicator_name)
  end
end

When(/^I add a level "(.*?)" to "(.*?)"$/) do |level_name, subject_name|
  click_link "Add a new level"
  fill_in "Level", with: level_name
  click_button 'Save'

  within(:css, '.breadcrumb') do
    page.should have_text(subject_name)
  end
  page.should have_text('Level was successfully created')
end

When(/^I add a topic "(.*?)" to "(.*?)"$/) do |topic_name, level_name|
  click_link "Add a new topic"
  fill_in "Topic", with: topic_name
  click_button 'Save'
  page.should have_text('Topic was successfully created')
end

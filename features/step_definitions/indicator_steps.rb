When(/^I visit the indicators page$/) do
  visit indicators_path
end

When(/^I add a subject "(.*?)"$/) do |subject_name|
  click_link 'Add a new subject'
  fill_in 'Name', with: subject_name
  click_button 'Save'
  page.should have_text('Subject was successfully created')
end

Then(/^I should be on the indicator page for "(.*?)"$/) do |indicator_name|
  page.should have_css(:h2, text: indicator_name)
end

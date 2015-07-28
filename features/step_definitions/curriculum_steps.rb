When(/^I visit the indicators page$/) do
  visit indicators_path
end

When(/^I add a subject "(.*?)"$/) do |subject_name|
  click_link 'Add a new subject'
  fill_in 'Name', with: 'subject_name'
  click_button 'Save'
  page.should have_text('Subject was successfully created')
end

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
  indicator = Indicator.find_by(name: indicator_name)
  text_field_id = "indicators_#{ indicator.friendly_type.downcase }_name"
  find_field(text_field_id).value.should eql(indicator_name)
end

When(/^I add a level "(.*?)" to "(.*?)"$/) do |level_name, subject_name|
  click_link "Add a new level"
  fill_in "Level", with: level_name
  click_button 'Save'
  page.should have_text('Level was successfully created')
end

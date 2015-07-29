When(/^I visit the indicators page$/) do
  visit indicators_path
end

When(/^I add a subject "(.*?)"$/) do |subject_name|
  click_link 'Add a new subject'
  fill_in 'Subject', with: subject_name
  click_button 'Save'
  page.should have_text('Subject was successfully created')
end

When(/^I add a level "(.*?)" to "(.*?)"$/) do |level_name, subject_name|
  click_link "Add a new level"
  fill_in "Level", with: level_name
  click_button 'Save'

  parent_name = Indicators::Level.find_by(name: level_name).parent.name
  parent_name.should eql(subject_name)
  page.should have_text('Level was successfully created')
end

When(/^I add a topic "(.*?)" to "(.*?)"$/) do |topic_name, level_name|
  click_link "Add a new topic"
  fill_in "Topic", with: topic_name
  click_button 'Save'

  parent_name = Indicators::Topic.find_by(name: topic_name).parent.name
  parent_name.should eql(level_name)
  page.should have_text('Topic was successfully created')
end

When(/^I add a strand "(.*?)" to "(.*?)"$/) do |strand_name, topic_name|
  click_link "Add a new strand"
  fill_in "Strand", with: strand_name
  click_button 'Save'

  parent_name = Indicators::Strand.find_by(name: strand_name).parent.name
  parent_name.should eql(topic_name)
  page.should have_text('Strand was successfully created')
end

When(/^I add a prompt "(.*?)" to "(.*?)"$/) do |prompt_name, strand_name|
  click_link "Add a new prompt"
  fill_in "Prompt", with: prompt_name
  click_button 'Save'

  parent_name = Indicators::Prompt.find_by(name: prompt_name).parent.name
  parent_name.should eql(strand_name)
  page.should have_text('Prompt was successfully created')
end

When(/^I add an objective "(.*?)" to "(.*?)"$/) do |objective_name, prompt_name|
  click_link "Add a new objective"
  fill_in "Objective", with: objective_name
  click_button 'Save'

  parent_name = Indicators::Objective.find_by(name: objective_name).parent.name
  parent_name.should eql(prompt_name)
  page.should have_text('Objective was successfully created')
end

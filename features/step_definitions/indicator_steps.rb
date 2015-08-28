Given(/^there is a curriculum "(.*?)"$/) do |curriculum_name|
  Fabricate(:indicators_curriculum, name: curriculum_name)
end

When(/^I add a curriculum "(.*?)"$/) do |curriculum_name|
  click_link 'Add a new curriculum'
  fill_in 'Curriculum name', with: curriculum_name
  click_button 'Save'
end

Given(/^there is a maths curriculum "(.*?)"$/) do |curriculum_name|
  setup_maths_indicators(curriculum_name)
end

When(/^I visit the curricula page$/) do
  within('ul.nav.navbar-nav', match: :first) do
    click_link 'Curricula'
  end
end

When(/^I visit the indicators page$/) do
  visit indicators_curricula_path
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

When(/^I add a prompt "(.*?)" to "(.*?)"$/) do |prompt_name, topic_name|
  click_link "Add a new prompt"
  fill_in "Prompt", with: prompt_name
  click_button 'Save'

  parent_name = Indicators::Prompt.find_by(name: prompt_name).parent.name
  parent_name.should eql(topic_name)
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

When(/^I change the name of topic "(.*?)" to "(.*?)"$/) do |topic_name, new_topic_name|
  click_link topic_name
  click_link "Edit"
  fill_in "Topic name", with: new_topic_name
  click_button 'Save'
  page.should have_text('Topic was successfully updated')
end

When(/^I can not delete "(.*?)"$/) do |indicator_name|
  click_link indicator_name
  page.should_not have_link('Delete')
end

When(/^I delete "(.*?)"$/) do |indicator_name|
  indicator_name = Indicator.find_by(name: indicator_name).name
  click_link indicator_name
  click_link 'Delete'
  page.should have_text("#{ indicator_name } was successfully deleted.")
end

Then(/^I should see (\d+) curricula$/) do |counter|
  page.should have_css('.well.curriculum', count: counter)
end

When(/^I go to the add a subject page for "(.*?)"$/) do |curriculum_name|
  c = Indicators::Curriculum.find_by(name: curriculum_name)
  visit "/indicators_subjects/new?parent_id=#{ c.id }"
end

When(/^I try to edit the subject "(.*?)"$/) do |subject_name|
  s = Indicators::Subject.find_by(name: subject_name)
  visit edit_indicators_subject_path(s)
end

def setup_maths_indicators(curriculum_name)
  curriculum = Fabricate(:indicators_curriculum, name: curriculum_name)
  subject = Fabricate(:indicators_subject, name: 'Maths', parent: curriculum)
  level_1 = Fabricate(:indicators_level, name: 'Year 1', parent: subject)
  level_2 = Fabricate(:indicators_level, name: 'Year 2', parent: subject)
  topic_1 = Fabricate(:indicators_topic, name: 'Number', parent: level_1)
  topic_2 = Fabricate(:indicators_topic, name: 'Number', parent: level_2)
  prompt = Fabricate(:indicators_prompt, name: 'Student will:', parent: topic_1)
  Fabricate(:indicators_objective, name: 'Addition and subtraction', parent: prompt)
  Fabricate(:indicators_objective, name: 'Advanced addition and subtraction', parent: topic_2)
end

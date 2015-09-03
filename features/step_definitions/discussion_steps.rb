Then(/^I should see the discussion fields$/) do
  page.should have_text('Discuss your experiences teaching Number')
end

When(/^I browse to "(.*?)" and click teach this$/) do |indicator_name|
  within('ol', text: indicator_name) do
    click_link "Teach this objective"
  end
end

Then(/^I should add a new class$/) do
 click_link 'Add a new class'
 page.should have_css('h1', 'Add a new class')
end

Then(/^I should pick a group and add a lesson with objective "(.*?)"$/) do |objective_name|
  click_link "Year 6A"

  # on show lesson page
  page.should have_text 'Lesson was successfully created'
  new_objective_name = Group.last.lessons.first.objectives.first.indicator.name
  expect(new_objective_name).to eql(objective_name)
end

Then(/^I should see the new class prompt$/) do
  page.should have_link 'Add a new class'
end

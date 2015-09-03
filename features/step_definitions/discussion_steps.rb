Then(/^I should see the discussion fields$/) do
  page.should have_text('Discuss your experiences teaching Number')
end

When(/^I browse to "(.*?)" and add it to a new lesson$/) do |indicator_name|
  within('ol', text: indicator_name) do
    click_link "Teach this objective"
  end
end

Then(/^I should be on the lesson page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I am not logged in I still want to see the curriculum discussion$/) do
  pending
  # note: remove this step entirely when we want to let everyone view the curriculum discussion
end

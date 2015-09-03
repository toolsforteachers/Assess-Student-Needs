Then(/^I should see the discussion fields$/) do
  page.should have_text('Discuss your experiences teaching Number')
end

When(/^I browse to "(.*?)" and click teach this$/) do |indicator_name|
  within('ol', text: indicator_name) do
    click_link "Teach this objective"
  end
end

Then(/^I should be on the lesson page$/) do
  pending # express the regexp above with the code you wish you had
end

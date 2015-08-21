Then(/^I should see the discussion fields$/) do
  page.should have_css('.topic', text: 'Number')
end

When(/^I am not logged in I still want to see the curriculum discussion$/) do
  pending
  # note: remove this step entirely when we want to let everyone view the curriculum discussion
end

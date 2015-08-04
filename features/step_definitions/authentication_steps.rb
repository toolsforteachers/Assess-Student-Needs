Then(/^I should be on the after sign_in page$/) do
  page.should have_css(:h1, 'Classes')
end

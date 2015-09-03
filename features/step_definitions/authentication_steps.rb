Then(/^I should be on the after sign_in page$/) do
  page.should have_css(:h1, 'Classes')
end

When(/^I invite "(.*?)"$/) do |email|
  click_link 'Invite colleagues'
  fill_in 'email address', with: email
  click_button 'Send invitation'
end

Then(/^"(.*?)" should accept the invitation$/) do |email|
  open_email(email)
  click_first_link_in_email

  fill_in 'Name', with: 'mark'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Save'
  page.should have_text('You are now signed in')
end

When(/^I sign out$/) do
  click_link 'Sign out'
end

Then(/^I should not be allowed$/) do
  page.should have_text('not allowed')
end

Then(/^I should see the register prompt$/) do
  page.should have_text('request a beta account')
  current_path.should match('sign_in')
end

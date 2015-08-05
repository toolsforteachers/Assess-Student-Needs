# :nocov:
When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

Then /^I should see "(.*?)" for "(.*?)"$/ do |text, scope|
 page.should have_css(scope, :text => text)
end

When /^I follow "(.*?)"$/ do |link_name|
  click_link link_name
end

When /^I press "(.*?)"$/ do |button_name|
  click_button button_name
end
# :nocov:

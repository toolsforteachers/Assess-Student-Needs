When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

Then /^I should see "(.*?)" for "(.*?)"$/ do |text, scope|
 page.should have_css(scope, :text => text)
end

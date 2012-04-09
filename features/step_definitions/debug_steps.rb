Then 'I debug' do
  binding.pry
  $cucumber_debugged = true
end

Then /^show me the page$/ do
  save_and_open_page
end

Then(/^I should get a pdf$/) do
  page.response_headers['Content-Disposition'].should match /pdf/
end

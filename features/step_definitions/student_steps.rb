Then /^I should see an APP grid for "(.*?)"$/ do |student_name|
  within(:css, ".page-header") do
    text.should have_content("APP Grid: #{ student_name }")
  end
end

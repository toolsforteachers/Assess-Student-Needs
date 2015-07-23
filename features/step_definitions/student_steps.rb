Then /^I should see an APP grid for "(.*?)" displaying level (\d+)$/ do |student_name, level|
  within(:css, ".page-header") do
    text.should have_content("APP Grid: #{ student_name }")
  end

  within(:css, "ul#levels .active") do
    text.should have_content("Level #{ level }")
  end
end

Given /^a student "(.*?)" with current level (\d+)$/ do |student_name, level|
  @student = Fabricate(:student, name: student_name, prior_knowledge_level: (level.to_i - 1))
end

Then /^I should see an APP grid for "(.*?)" displaying level (\d+)$/ do |student_name, level|
  within(:css, ".page-header") do
    text.should have_content("APP Grid: #{ student_name }")
  end

  within(:css, "ul#levels .active") do
    text.should have_content("Level #{ level }")
  end
end
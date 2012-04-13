When /^I record a score of (\d+) for "([^"]*)"$/ do |student_name, amount|
  within("//li[@id='#{ student_name }']") do
    fill_in :score, with: amount
  end
end

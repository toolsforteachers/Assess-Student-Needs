Given(/^there is a subject "(.*?)"$/) do |subject_name|
  subject = Fabricate(:indicators_subject, name: subject_name)
  setup_maths_indicators
end

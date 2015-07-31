Given(/^there is a subject "(.*?)"$/) do |subject_name|
  subject = Fabricate(:indicators_subject, name: subject_name)
  level = Fabricate(:indicators_subject, name: 'Year 1', parent: subject)
  topic = Fabricate(:indicators_topic, name: 'Number', parent: level)
  strand = Fabricate(:indicators_strand, name: 'Number', parent: topic)
  Fabricate(:indicators_objective, name: 'bar', parent: strand)
  Fabricate(:indicators_objective, name: 'foo', parent: strand)
end

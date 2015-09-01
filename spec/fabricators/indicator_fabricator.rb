Fabricator(:indicator) do
  name { Faker::Lorem.sentence }
end

Fabricator(:indicators_curriculum, from: :indicator) do
  type 'Indicators::Curriculum'
  created_by { Fabricate(:teacher) }
end

Fabricator(:indicators_subject, from: :indicator) do
  type 'Indicators::Subject'
  parent { Fabricate(:indicators_curriculum) }
end

Fabricator(:indicators_level, from: :indicator) do
  type 'Indicators::Level'
end

Fabricator(:indicators_topic, from: :indicator) do
  type 'Indicators::Topic'
end

Fabricator(:indicators_prompt, from: :indicator) do
  type 'Indicators::Prompt'
end

Fabricator(:indicators_objective, from: :indicator) do
  type 'Indicators::Objective'
end

Fabricator(:indicators_pedagogy, from: :indicator) do
  type 'Indicators::Pedagogy'
  created_by { Fabricate(:teacher) }
end

Fabricator(:indicators_learning_attribute, from: :indicator) do
  type 'Indicators::LearningAttribute'
end

Fabricator(:indicators_learning_skill, from: :indicator) do
  type 'Indicators::LearningSkill'
end

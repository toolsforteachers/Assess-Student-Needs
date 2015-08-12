Fabricator(:indicator) do
  name { Faker::Lorem.sentence }
end

Fabricator(:subject, from: :indicator) do
  type 'Indicators::Subject'
end

Fabricator(:indicators_subject, from: :indicator) do
  type 'Indicators::Subject'
end

Fabricator(:indicators_level, from: :indicator) do
  type 'Indicators::Level'
end

Fabricator(:indicators_topic, from: :indicator) do
  type 'Indicators::Topic'
end

Fabricator(:indicators_strand, from: :indicator) do
  type 'Indicators::Strand'
end

Fabricator(:indicators_prompt, from: :indicator) do
  type 'Indicators::Prompt'
end

Fabricator(:indicators_objective, from: :indicator) do
  type 'Indicators::Objective'
end

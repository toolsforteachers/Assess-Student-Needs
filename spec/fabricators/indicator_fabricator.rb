Fabricator(:indicator) do
  name { Faker::Lorem.sentence }
end

Fabricator(:indicators_objective, from: :indicator) do
  type 'Indicators::Objective'
end

Fabricator(:objective) do
  indicator { Fabricate(:indicators_objective) }
  lesson
  stream { Faker::Lorem.characters(10) }
end

Fabricator(:objective) do
  indicator { Fabricate(:indicator) }
  lesson
  stream { Faker::Lorem.characters(10) }
end

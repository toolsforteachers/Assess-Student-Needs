Fabricator(:student) do
  name { Faker::Name.name }
  group
end

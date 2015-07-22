Fabricator(:group) do
  name(Faker::Team.name)
  teacher
end

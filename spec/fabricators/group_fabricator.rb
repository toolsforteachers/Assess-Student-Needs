Fabricator(:group) do
  name(Faker::Team.name)
  teacher
  subject { Fabricate(:indicators_subject) }
end


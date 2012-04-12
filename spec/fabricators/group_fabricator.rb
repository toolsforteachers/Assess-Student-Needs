Fabricator(:group) do
  name 'year 6A'
end

Fabricator(:group_with_two_students, from: :group) do
  students(:count => 2) { |group, i| group.students << Fabricate(:student) }
end
Fabricator(:lesson) do
  subject { Fabricate(:indicators_subject) }
  group
  notes 'Adding and subtracting'
  lesson_date 1.day.ago
end

Fabricator(:lesson) do
  teacher
  group
  name 'Adding and subtracting'
  lesson_datetime 1.day.ago
end
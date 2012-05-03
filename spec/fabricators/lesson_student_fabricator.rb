Fabricator(:lesson_student) do
  lesson { Fabricate(:lesson) }
  student { Fabricate(:student) }
end
Fabricator(:assessment_student) do
  assessment { Fabricate(:lesson) }
  student { Fabricate(:student) }
end
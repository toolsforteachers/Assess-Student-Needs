Fabricator(:assessment_student) do
  assessment { Fabricate(:lesson) }
  student { Fabricate(:student) }
  score 1
end
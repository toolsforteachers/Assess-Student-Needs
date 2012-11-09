Fabricator(:teacher_judgement) do
  teacher
  group
  indicator { Fabricate(:indicator) }
end
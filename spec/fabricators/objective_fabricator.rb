Fabricator(:objective) do
  indicator { Fabricate(:indicator) }
  lesson
end

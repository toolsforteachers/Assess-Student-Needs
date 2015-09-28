Fabricator(:objective) do
  indicator { Fabricate(:indicators_objective) }
  lesson
end

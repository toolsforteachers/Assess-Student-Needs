Fabricator(:assessment) do
  indicator { Fabricate(:indicators_objective) }
  assessor { Fabricate(:lesson) }
end

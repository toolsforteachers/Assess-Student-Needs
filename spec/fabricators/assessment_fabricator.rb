Fabricator(:assessment) do
  indicator { Fabricate(:indicator) }
end

Fabricator(:level_1_assessment, from: :assessment) do
  indicator { Fabricate(:indicator) }
end

Fabricator(:level_3_assessment, from: :assessment) do
  indicator { Fabricate(:indicator) }
end

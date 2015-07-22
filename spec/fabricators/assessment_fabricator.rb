Fabricator(:assessment) do
  group
  indicator { Fabricate(:indicator) }
end

Fabricator(:level_1_assessment, from: :assessment) do
  indicator { Fabricate(:indicator, level: 1) }
end

Fabricator(:level_3_assessment, from: :assessment) do
  indicator { Fabricate(:indicator, level: 3) }
end

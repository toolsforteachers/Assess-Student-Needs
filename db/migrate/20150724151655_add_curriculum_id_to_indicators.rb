class AddCurriculumIdToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :curriculum_id, :integer, index: true
  end
end

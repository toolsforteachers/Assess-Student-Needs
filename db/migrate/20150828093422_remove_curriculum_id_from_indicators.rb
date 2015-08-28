class RemoveCurriculumIdFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :curriculum_id, :integer
  end
end

class AddCurriculumIdToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :curriculum_id, :integer, index: :true
  end
end

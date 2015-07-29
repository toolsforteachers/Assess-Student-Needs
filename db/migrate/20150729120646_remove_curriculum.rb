class RemoveCurriculum < ActiveRecord::Migration
  def change
    drop_table :curricula
    remove_column :groups, :curriculum_id
  end
end

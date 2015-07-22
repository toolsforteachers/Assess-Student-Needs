class AddTeacherIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :teacher_id, :integer
    add_index :groups, :teacher_id
  end
end

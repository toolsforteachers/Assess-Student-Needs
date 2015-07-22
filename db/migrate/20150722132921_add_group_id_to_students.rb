class AddGroupIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :group_id, :integer
    add_index :students, :group_id
  end
end

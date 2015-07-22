class DropGroupStudents < ActiveRecord::Migration
  def change
    drop_table :group_students
  end
end

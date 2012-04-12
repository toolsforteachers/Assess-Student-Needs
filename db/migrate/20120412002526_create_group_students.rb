class CreateGroupStudents < ActiveRecord::Migration
  def change
    create_table :group_students do |t|
      t.references :group
      t.references :student
      t.timestamps
    end
  end
end

class RenameLessons < ActiveRecord::Migration
  def up
    rename_table :lessons, :assessments
    rename_table :lesson_students, :assessment_students
    rename_column :assessment_students, :lesson_id, :assessment_id
    add_column :assessments, :type, :string
    ActiveRecord::Base.connection.execute("update assessments set type = 'Lesson'")
  end

  def down
    remove_column :assessments, :type, :string
    rename_table :assessments, :lessons
    rename_column :assessment_students, :assessment_id, :lesson_id
    rename_table :assessment_students, :lesson_students
  end
end
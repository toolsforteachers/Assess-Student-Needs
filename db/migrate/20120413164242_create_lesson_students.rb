class CreateLessonStudents < ActiveRecord::Migration
  def change
    create_table :lesson_students do |t|
      t.references :lesson
      t.references :student
      t.timestamps
    end
  end
end

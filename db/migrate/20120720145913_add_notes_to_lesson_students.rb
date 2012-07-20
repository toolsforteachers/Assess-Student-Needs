class AddNotesToLessonStudents < ActiveRecord::Migration
  def change
    add_column :lesson_students, :notes, :string, limit: 500
  end
end

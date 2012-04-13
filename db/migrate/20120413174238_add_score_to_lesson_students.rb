class AddScoreToLessonStudents < ActiveRecord::Migration
  def change
    add_column :lesson_students, :score, :integer
  end
end

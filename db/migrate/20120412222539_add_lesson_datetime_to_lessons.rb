class AddLessonDatetimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_datetime, :datetime
  end
end

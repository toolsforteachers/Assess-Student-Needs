class CreateLessonsTable < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.belongs_to :group, index: true
      t.string :name
      t.text :notes
      t.date :lesson_date
      t.timestamps
    end
  end
end

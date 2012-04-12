class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.references :teacher
      t.references :group
      t.timestamps
    end
  end
end

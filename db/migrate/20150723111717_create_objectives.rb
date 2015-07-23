class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.belongs_to :lesson, index: true
      t.string :name
      t.integer :indicator_id
      t.timestamps null: false
    end
  end
end

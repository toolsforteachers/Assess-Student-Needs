class CreateCurricula < ActiveRecord::Migration
  def change
    create_table :curricula do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end

class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :name
      t.integer :level
      t.timestamps
    end
  end
end

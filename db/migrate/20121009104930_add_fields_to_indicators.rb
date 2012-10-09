class AddFieldsToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :key, :string
    add_column :indicators, :description, :text
    add_column :indicators, :position, :integer
    add_index :indicators, :key
  end
end
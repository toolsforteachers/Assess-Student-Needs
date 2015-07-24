class RemoveFieldsFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :level, :string
    remove_column :indicators, :key, :string
    remove_column :indicators, :description, :string
  end
end

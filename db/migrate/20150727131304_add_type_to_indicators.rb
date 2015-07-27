class AddTypeToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :type, :string, index: true
  end
end

class AddCreatedByToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :created_by_id, :integer, index: true
  end
end

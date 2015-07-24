class AddParentIdToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :parent_id, :integer
  end
end

class AddCachedAncestryNameToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :cached_ancestry_name, :text
  end
end

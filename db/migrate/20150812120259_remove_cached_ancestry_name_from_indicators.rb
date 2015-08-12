class RemoveCachedAncestryNameFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :cached_ancestry_name, :text
  end
end

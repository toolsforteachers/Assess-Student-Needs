class AddSlugToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :slug, :string, index: true
  end
end

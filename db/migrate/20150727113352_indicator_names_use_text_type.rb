class IndicatorNamesUseTextType < ActiveRecord::Migration
  def up
    change_column :indicators, :name, :text
  end

  def down
    change_column :indicators, :name, :string
  end
end

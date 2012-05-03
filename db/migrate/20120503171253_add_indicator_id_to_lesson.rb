class AddIndicatorIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :indicator_id, :integer
  end
end

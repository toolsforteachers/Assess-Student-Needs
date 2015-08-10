class RemoveNameFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :name, :string
  end
end

class RemoveStreamFromObjectives < ActiveRecord::Migration
  def change
    remove_column :objectives, :stream, :string
  end
end

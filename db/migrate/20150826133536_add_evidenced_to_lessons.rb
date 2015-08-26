class AddEvidencedToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :evidenced, :boolean, default: false
  end
end

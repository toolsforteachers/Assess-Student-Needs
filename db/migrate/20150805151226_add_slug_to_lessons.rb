class AddSlugToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :slug, :string, index: :true
  end
end

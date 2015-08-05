class AddSlugToStudents < ActiveRecord::Migration
  def change
    add_column :students, :slug, :string, index: :true
  end
end

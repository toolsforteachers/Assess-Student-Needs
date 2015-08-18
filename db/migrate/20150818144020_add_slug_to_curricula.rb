class AddSlugToCurricula < ActiveRecord::Migration
  def change
    add_column :curricula, :slug, :string, index: :true
  end
end

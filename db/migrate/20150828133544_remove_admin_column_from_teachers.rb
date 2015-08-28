class RemoveAdminColumnFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :admin, :boolean
  end
end

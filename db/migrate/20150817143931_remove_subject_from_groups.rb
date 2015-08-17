class RemoveSubjectFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :subject_id, :integer
  end
end

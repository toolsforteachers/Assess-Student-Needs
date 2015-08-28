class RemoveSubjectFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :subject_id, :integer
  end
end

class RemoveTeacherIdFromAssessments < ActiveRecord::Migration
  def change
    remove_column :assessments, :teacher_id, :integer
  end
end

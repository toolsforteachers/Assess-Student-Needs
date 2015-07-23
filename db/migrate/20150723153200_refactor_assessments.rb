class RefactorAssessments < ActiveRecord::Migration
  def change
    drop_table :assessment_students

    remove_column :assessments, :lesson_datetime, :datetime
    remove_column :assessments, :group_id, :integer
    remove_column :assessments, :type, :string
    remove_column :assessments, :notes, :string

    add_column :assessments, :student_id, :integer, index: true
    add_column :assessments, :indicator_id, :integer, index: true
    add_column :assessments, :assessor_id, :integer, index: true
    add_column :assessments, :assessor_type, :string, index: true
    add_column :assessments, :score, :integer
  end
end

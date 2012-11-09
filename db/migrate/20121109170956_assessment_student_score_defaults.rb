class AssessmentStudentScoreDefaults < ActiveRecord::Migration
  def up
    change_column :assessment_students, :score, :integer, default: 0
  end

  def down
  end
end
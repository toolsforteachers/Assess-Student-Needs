class AddMarkAndOutOfToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :mark, :integer
    add_column :assessments, :out_of, :integer
    remove_column :assessments, :score, :integer
  end
end

class ChangeNameToNotesForAssessments < ActiveRecord::Migration
  def change
    remove_column :assessments, :name, :string
    add_column :assessments, :notes, :text
  end
end

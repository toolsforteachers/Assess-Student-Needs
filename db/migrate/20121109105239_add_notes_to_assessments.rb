class AddNotesToAssessments < ActiveRecord::Migration
  def change
    change_table :assessments do |t|
      t.string :notes
    end
  end
end

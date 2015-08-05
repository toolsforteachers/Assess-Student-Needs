class RemovePriorKnowledgeLevelFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :prior_knowledge_level, :integer
  end
end

class AddPriorKnowledgeLevelToStudents < ActiveRecord::Migration
  def change
    add_column :students, :prior_knowledge_level, :integer
  end
end
class CreateIndicatorHierarchies < ActiveRecord::Migration
  def change
    create_table :indicator_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :indicator_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "indicator_anc_desc_idx"

    add_index :indicator_hierarchies, [:descendant_id],
      name: "indicator_desc_idx"
  end
end

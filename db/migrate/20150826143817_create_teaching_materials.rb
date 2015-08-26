class CreateTeachingMaterials < ActiveRecord::Migration
  def change
    create_table :teaching_materials do |t|
      t.string :file_id
      t.references :attachable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end

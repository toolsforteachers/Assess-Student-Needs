class AddMetaDataFieldsToTeachingMaterials < ActiveRecord::Migration
  def change
    add_column :teaching_materials, :file_filename, :string
    add_column :teaching_materials, :file_size, :integer
    add_column :teaching_materials, :file_content_type, :string
  end
end

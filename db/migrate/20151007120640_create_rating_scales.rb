class CreateRatingScales < ActiveRecord::Migration
  def change
    create_table :rating_scales do |t|
      t.string :name
      t.integer :max_score
      t.jsonb :ordinals, default: {}, null: false
      t.string :slug, index: true
      t.timestamps null: false
    end
  end
end

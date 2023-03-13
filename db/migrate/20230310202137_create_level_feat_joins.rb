class CreateLevelFeatJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :level_feat_joins do |t|
      t.references :level, null: false, foreign_key: true
      t.references :feat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

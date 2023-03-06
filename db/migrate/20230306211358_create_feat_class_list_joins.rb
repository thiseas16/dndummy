class CreateFeatClassListJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :feat_class_list_joins do |t|
      t.references :feat, null: false, foreign_key: true
      t.references :class_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

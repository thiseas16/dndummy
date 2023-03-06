class CreateSpellClassListJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :spell_class_list_joins do |t|
      t.references :class_list, null: false, foreign_key: true
      t.references :spell, null: false, foreign_key: true

      t.timestamps
    end
  end
end

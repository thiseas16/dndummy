class CreateCharacterProficiencyJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :character_proficiency_joins do |t|
      t.references :character, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end
  end
end

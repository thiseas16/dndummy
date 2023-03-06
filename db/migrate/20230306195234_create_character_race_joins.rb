class CreateCharacterRaceJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :character_race_joins do |t|
      t.references :race, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end

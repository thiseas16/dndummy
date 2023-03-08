class CreateRaceLanguageJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :race_language_joins do |t|
      t.references :race, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end

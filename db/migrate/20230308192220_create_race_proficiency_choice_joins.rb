class CreateRaceProficiencyChoiceJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :race_proficiency_choice_joins do |t|
      t.references :race, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTraitProficiencyChoiceJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :trait_proficiency_choice_joins do |t|
      t.references :trait, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end
  end
end

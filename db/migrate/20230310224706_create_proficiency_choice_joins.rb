class CreateProficiencyChoiceJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_choice_joins do |t|
      t.references :proficiency_choice, null: false, foreign_key: true
      t.references :proficiency, null: false, foreign_key: true

      t.timestamps
    end
  end
end

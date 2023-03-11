class CreateProficiencyChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :proficiency_choices do |t|
      t.integer :no_of_choices
      t.references :class_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

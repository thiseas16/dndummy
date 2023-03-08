class CreateClassListProficiencyJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :class_list_proficiency_joins do |t|
      t.references :class_list, null: false, foreign_key: true
      t.references :proficiency, nlul: false, foreign_key: true

      t.timestamps
    end
  end
end

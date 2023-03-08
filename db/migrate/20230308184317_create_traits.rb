class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :name
      t.text :description
      t.integer :proficiency_choice_number

      t.timestamps
    end
  end
end

class CreateRaceTraitJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :race_trait_joins do |t|
      t.references :race, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end

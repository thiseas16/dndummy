class CreateAbilityBonuses < ActiveRecord::Migration[7.0]
  def change
    create_table :ability_bonuses do |t|
      t.integer :bonus
      t.string :ability_name
      t.references :race, null: false, foreign_key: true

      t.timestamps
    end
  end
end

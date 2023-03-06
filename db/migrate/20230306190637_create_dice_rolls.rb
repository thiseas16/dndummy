class CreateDiceRolls < ActiveRecord::Migration[7.0]
  def change
    create_table :dice_rolls do |t|
      t.integer :ammount_of_dice
      t.integer :type_of_dice
      t.integer :total
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end

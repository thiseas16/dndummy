class CreateAttacks < ActiveRecord::Migration[7.0]
  def change
    create_table :attacks do |t|
      t.references :character, null: false, foreign_key: true
      t.string :weapon
      t.integer :attack_modifier
      t.string :dmg
      t.string :dmg_type
      t.integer :range

      t.timestamps
    end
  end
end

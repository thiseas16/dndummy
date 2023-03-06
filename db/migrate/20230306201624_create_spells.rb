class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.text :higher_lvl
      t.integer :range
      t.integer :lvl
      t.string :attack_type
      t.string :dmg_type
      t.integer :dmg_at_lvl_1
      t.integer :dmg_at_lvl_2
      t.integer :dmg_at_lvl_3
      t.integer :dmg_at_lvl_4
      t.integer :dmg_at_lvl_5
      t.integer :dmg_at_lvl_6
      t.integer :dmg_at_lvl_7
      t.integer :dmg_at_lvl_8
      t.integer :dmg_at_lvl_9
      t.string :school
      t.boolean :somatic_component
      t.boolean :verbal_component
      t.boolean :material_component

      t.timestamps
    end
  end
end

class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.integer :lvl
      t.integer :ability_score_bonuses
      t.integer :prof_bonus
      t.integer :cantrips_known
      t.integer :spells_known
      t.integer :spell_slots_lvl_1
      t.integer :spells_slots_lvl_2
      t.integer :spell_slots_lvl_3
      t.integer :spell_slots_lvl_4
      t.integer :spell_slots_lvl_5
      t.integer :spell_slots_lvl_6
      t.integer :spell_slots_lvl_7
      t.integer :spell_slots_lvl_8
      t.integer :spell_slots_lvl_9
      t.boolean :spellcasting
      t.text :class_specific
      t.references :class_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

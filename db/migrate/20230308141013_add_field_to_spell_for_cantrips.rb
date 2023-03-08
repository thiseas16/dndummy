class AddFieldToSpellForCantrips < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :dmg_at_character_lvl_1, :string
    add_column :spells, :dmg_at_character_lvl_5, :string
    add_column :spells, :dmg_at_character_lvl_11, :string
    add_column :spells, :dmg_at_character_lvl_17, :string
  end
end

class ChangeSpellDmg < ActiveRecord::Migration[7.0]
  def change
    change_column :spells, :dmg_at_lvl_1, :string
    change_column :spells, :dmg_at_lvl_2, :string
    change_column :spells, :dmg_at_lvl_3, :string
    change_column :spells, :dmg_at_lvl_4, :string
    change_column :spells, :dmg_at_lvl_5, :string
    change_column :spells, :dmg_at_lvl_6, :string
    change_column :spells, :dmg_at_lvl_7, :string
    change_column :spells, :dmg_at_lvl_8, :string
    change_column :spells, :dmg_at_lvl_9, :string
  end
end

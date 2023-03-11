class FixSpellField < ActiveRecord::Migration[7.0]
  def change
    rename_column :levels, :spells_slots_lvl_2, :spell_slots_lvl_2
  end
end

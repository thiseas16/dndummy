class AddSpellFields < ActiveRecord::Migration[7.0]
  def change
    change_column :spells, :range, :integer
    add_column :spells, :material, :string
    add_column :spells, :area_of_effect, :string
  end
end

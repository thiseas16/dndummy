class ChangeSpellRange < ActiveRecord::Migration[7.0]
  def change
    change_column :spells, :range, :string
  end
end

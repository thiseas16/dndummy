class AddFieldsToSpell < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :duration, :string
    add_column :spells, :casting_time, :string
    add_column :spells, :concentration, :boolean
    add_column :spells, :ritual, :boolean
  end
end

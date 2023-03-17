class DropCharacterClassJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :character_race_joins
    add_column :characters, :race, :string
  end
end

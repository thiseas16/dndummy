class CharacterNullEncounterFix < ActiveRecord::Migration[7.0]
  def change
    change_column :characters, :encounter_id, :bigint, null: true
  end
end

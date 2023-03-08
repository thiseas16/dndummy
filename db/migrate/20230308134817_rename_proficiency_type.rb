class RenameProficiencyType < ActiveRecord::Migration[7.0]
  def change
    rename_column :proficiencies, :type, :prof_type
  end
end

class FinalTablesForChoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :class_lists, :item_choice
    remove_column :class_lists, :proficiency_choice
  end
end

class RenameJoinTablesItemAndFeatForClass < ActiveRecord::Migration[7.0]
  def change
    rename_table :class_list_proficiency_joins, :class_list_proficiency_granted_joins
    rename_table :class_list_item_joins, :class_list_item_granted_joins
  end
end

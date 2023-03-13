class DropChoiceTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :class_list_item_choice_joins
    drop_table :class_list_proficiency_choice_joins
  end
end

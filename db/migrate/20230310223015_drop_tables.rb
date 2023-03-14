class DropTables < ActiveRecord::Migration[7.0]
  def change
    # drop_table :item_choices
    # drop_table :proficiency_choices
    add_column :class_lists, :item_choice, :integer
    add_column :class_lists, :proficiency_choice, :integer
  end
end

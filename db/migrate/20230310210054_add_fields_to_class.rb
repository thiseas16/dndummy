class AddFieldsToClass < ActiveRecord::Migration[7.0]
  def change
    add_column :class_lists, :h1, :text
    add_column :class_lists, :h2, :text
    add_column :class_lists, :h3, :text
    add_column :class_lists, :h4, :text
  end
end

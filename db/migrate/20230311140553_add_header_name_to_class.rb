class AddHeaderNameToClass < ActiveRecord::Migration[7.0]
  def change
    add_column :class_lists, :h1_title, :string
    add_column :class_lists, :h2_title, :string
    add_column :class_lists, :h3_title, :string
    add_column :class_lists, :h4_title, :string
  end
end

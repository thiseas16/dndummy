class AddDescToClass < ActiveRecord::Migration[7.0]
  def change
    add_column :class_lists, :description, :text
  end
end

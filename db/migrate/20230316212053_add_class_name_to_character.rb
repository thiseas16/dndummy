class AddClassNameToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :class_list, :string
  end
end

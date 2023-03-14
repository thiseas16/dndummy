class ChangeTypeClassSpecific < ActiveRecord::Migration[7.0]
  def change
    change_column :levels, :class_specific, :text
  end
end

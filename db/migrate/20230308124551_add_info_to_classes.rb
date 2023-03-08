class AddInfoToClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :class_lists, :hit_die, :integer
    add_column :class_lists, :proficiency_ammount, :integer
  end
end

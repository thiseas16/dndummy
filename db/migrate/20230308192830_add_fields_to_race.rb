class AddFieldsToRace < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :speed, :integer
    add_column :races, :age, :integer
    add_column :races, :alignment, :string
    add_column :races, :size, :string
    add_column :races, :size_description, :string
    add_column :races, :language_description, :text
    add_column :races, :proficiency_choice_number, :integer
  end
end

class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :character, null: false, foreign_key: true
      t.string :name
      t.boolean :proficiency
      t.string :stat_modifier
      t.integer :bonus
      t.integer :total

      t.timestamps
    end
  end
end

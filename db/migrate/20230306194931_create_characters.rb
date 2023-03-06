class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.string :alignment
      t.integer :exp
      t.integer :total_hp
      t.integer :current_hp
      t.integer :temp_hp
      t.text :personality_traits
      t.text :ideals
      t.text :bonds
      t.text :flaws
      t.integer :speed
      t.integer :armor_class
      t.integer :inititiave
      t.text :backstory
      t.text :appearance
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :eyes
      t.string :skin
      t.string :hair
      t.integer :dex
      t.integer :str
      t.integer :const
      t.integer :cha
      t.integer :int
      t.integer :wis
      t.references :campaign, null: false, foreign_key: true
      t.references :encounter, null: false, foreign_key: true

      t.timestamps
    end
  end
end

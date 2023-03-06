class CreateFeats < ActiveRecord::Migration[7.0]
  def change
    create_table :feats do |t|
      t.string :name
      t.text :description
      t.integer :lvl

      t.timestamps
    end
  end
end

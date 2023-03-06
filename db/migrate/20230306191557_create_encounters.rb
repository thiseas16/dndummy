class CreateEncounters < ActiveRecord::Migration[7.0]
  def change
    create_table :encounters do |t|
      t.string :title
      t.text :description
      t.text :tactics
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end

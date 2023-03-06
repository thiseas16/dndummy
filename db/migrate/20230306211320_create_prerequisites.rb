class CreatePrerequisites < ActiveRecord::Migration[7.0]
  def change
    create_table :prerequisites do |t|
      t.string :name
      t.references :feat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

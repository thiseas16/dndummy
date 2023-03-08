class CreateSavingThrows < ActiveRecord::Migration[7.0]
  def change
    create_table :saving_throws do |t|
      t.string :name
      t.references :class_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

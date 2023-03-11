class CreateItemChoiceJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :item_choice_joins do |t|
      t.references :item, null: false, foreign_key: true
      t.references :item_choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class ItemChoiceJoin < ApplicationRecord
  belongs_to :item
  belongs_to :item_choice
end

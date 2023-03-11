class ItemChoice < ApplicationRecord
  belongs_to :class_list
  has_many :item_choice_joins
  has_many :items, through: :item_choice_joins
end

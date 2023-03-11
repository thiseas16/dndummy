class ClassList < ApplicationRecord
  has_one_attached :photo
  has_many :spell_class_list_joins
  has_many :spells, through: :spell_class_list_joins
  has_many :feat_class_list_joins
  has_many :feats, through: :feat_class_list_joins
  has_many :character_class_list_joins
  has_many :characters, through: :character_class_list_joins

  has_many :class_list_proficiency_granted_joins
  has_many :proficiencies, through: :class_list_proficiency_granted_joins

  has_many :class_list_item_granted_joins
  has_many :items_granted, through: :class_list_item_granted_joins, source: :item

  has_many :saving_throws
  has_many :levels

  has_many :item_choices
  has_many :proficiency_choices
  # has_many :items_choice_joins, through: :item_choices
  # has_many :items, through: :item_choice_joins
end

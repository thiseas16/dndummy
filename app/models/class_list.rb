class ClassList < ApplicationRecord
  has_many :spell_class_list_joins
  has_many :spells, through: :spell_class_list_joins
  has_many :feat_class_joins
  has_many :feats, through: :feats_class_joins
  has_many :character_class_list_joins
  has_many :characters, through: :character_class_list_joins
  has_many :class_list_proficiency_joins
  has_many :proficiencies, through: :character_class_list_joins
  has_many :class_list_item_joins
  has_many :items, through: :class_list_item_joins
  has_many :saving_throws
end

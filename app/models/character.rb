class Character < ApplicationRecord
  belongs_to :campaign
  belongs_to :encounter, optional: true
  has_many :character_spell_joins
  has_many :spells, through: :character_spell_joins
  has_many :character_proficiency_joins
  has_many :proficiencies, through: :character_proficiency_joins
  has_many :character_race_joins
  has_many :races, through: :character_race_joins
  has_many :character_feat_joins
  has_many :feats, through: :character_feat_joins
  has_many :character_item_joins
  has_many :items, through: :character_item_joins
  has_many :character_class_list_joins
  has_many :class_lists, through: :character_class_list_joins
  has_many :character_language_joins
  has_many :languages, through: :character_language_joins
  has_many :attacks
  has_many :skills
end

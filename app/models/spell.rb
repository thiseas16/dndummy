class Spell < ApplicationRecord
  has_many :character_spell_joins
  has_many :characters, through: :character_spell_joins
  has_many :spell_class_joins
  has_many :class_lists, through: :spell_class_join
end

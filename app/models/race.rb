class Race < ApplicationRecord
  has_many :ability_bonuses
  has_many :character_race_joins
  has_many :characters, through: :character_race_joins
  has_many :race_language_joins
  has_many :languages, through: :race_language_joins
  has_many :race_trait_joins
  has_many :traits, through: :race_trait_joins
  has_many :race_proficiency_choice_joins
  has_many :proficiencies, through: :race_proficiency_choice_joins
  has_many :race_proficiency_granted_joins
  has_many :proficiencies, through: :race_proficiency_granted_joins
end

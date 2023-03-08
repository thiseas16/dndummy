class Trait < ApplicationRecord
  has_many :race_trait_joins
  has_many :races, through: :race_trait_joins
  has_many :trait_proficiency_granted_joins
  has_many :proficiencies, through: :trait_proficiency_granted_joins
  has_many :trait_proficiency_choice_joins
  has_many :proficiencies, through: :trait_proficiency_choice_joins
end

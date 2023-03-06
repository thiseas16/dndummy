class Proficiency < ApplicationRecord
  has_many :character_proficiency_joins
  has_many :characters, through: :character_proficiency_joins
end

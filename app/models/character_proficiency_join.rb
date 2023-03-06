class CharacterProficiencyJoin < ApplicationRecord
  belongs_to :character
  belongs_to :proficiency
end

class CharacterRaceJoin < ApplicationRecord
  belongs_to :race
  belongs_to :character
end

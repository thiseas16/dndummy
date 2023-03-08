class RaceProficiencyGrantedJoin < ApplicationRecord
  belongs_to :race
  belongs_to :proficiency
end

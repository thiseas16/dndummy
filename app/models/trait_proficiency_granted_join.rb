class TraitProficiencyGrantedJoin < ApplicationRecord
  belongs_to :trait
  belongs_to :proficiency
end

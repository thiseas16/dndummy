class ProficiencyChoice < ApplicationRecord
  belongs_to :class_list
  has_many :proficiency_choice_join
  has_many :proficiencies, through: :proficiency_choice_join
end

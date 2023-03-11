class ClassListProficiencyGrantedJoin < ApplicationRecord
  belongs_to :class_list
  belongs_to :proficiency
end

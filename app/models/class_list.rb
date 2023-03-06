class ClassList < ApplicationRecord
  has_many :spell_class_joins
  has_many :feat_class_joins
  has_many :character_class_list_joins
end

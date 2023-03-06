class SpellClassListJoin < ApplicationRecord
  belongs_to :class_list
  belongs_to :spell
end

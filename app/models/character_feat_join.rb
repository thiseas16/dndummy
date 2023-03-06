class CharacterFeatJoin < ApplicationRecord
  belongs_to :feat
  belongs_to :character
end

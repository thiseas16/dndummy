class CharacterSpellJoin < ApplicationRecord
  belongs_to :spell
  belongs_to :character
end

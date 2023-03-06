class Race < ApplicationRecord
  has_many :character_race_joins
  has_many :characters, through: :character_race_joins
end

class Encounter < ApplicationRecord
  belongs_to :campaign
  has_many :characters
end

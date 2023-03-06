class Campaign < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :dice_rolls
  has_many :encounters
end

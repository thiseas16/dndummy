class Campaign < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :images
  has_many :dice_rolls
  has_many :encounters
end

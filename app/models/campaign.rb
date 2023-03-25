class Campaign < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :dice_rolls
  has_many :encounters, dependent: :destroy
  has_many :characters, dependent: :destroy
end

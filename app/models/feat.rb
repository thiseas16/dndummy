class Feat < ApplicationRecord
  has_many :character_feat_join
  has_many :feat_class_joins
  has_many :prerequisites
end

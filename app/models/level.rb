class Level < ApplicationRecord
  belongs_to :class_list
  has_many :level_feat_joins
  has_many :feats, through: :level_feat_joins
end

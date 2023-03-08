class Feat < ApplicationRecord
  belongs_to :parent_feat, class_name: 'Feat', optional: true
  has_many :character_feat_join
  has_many :feat_class_list_joins
  has_many :class_lists, through: :feat_class_list_joins
  has_many :prerequisites
end

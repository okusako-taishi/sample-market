class Item < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code



  belongs_to :user, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :brand
  accepts_nested_attributes_for :brand
end

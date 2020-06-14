class Item < ApplicationRecord

  include JpPrefecture
  jp_prefecture :prefecture_code

  belongs_to :user
  has_many :images
  belongs_to :category
  belongs_to :brand
end

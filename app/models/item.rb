class Item < ApplicationRecord
<<<<<<< HEAD

  include JpPrefecture
  jp_prefecture :prefecture_code

  belongs_to :user
  has_many :images
=======
  belongs_to :user, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
>>>>>>> サーバーサイド商品出品-奥迫
  belongs_to :category
  belongs_to :brand
end

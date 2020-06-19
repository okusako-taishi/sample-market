class Item < ApplicationRecord
  has_many :comments, dependent: :destroy

  belongs_to :seller, class_name: "User" , optional: true,foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", optional: true,foreign_key: "buyer_id"

  belongs_to :user
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true, foreign_key: "auction_id"
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true , length: { maximum: 10 }

  belongs_to :category

  belongs_to :brand ,optional: true 
  accepts_nested_attributes_for :brand

  validates :text, presence: true
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length:  { maximum: 40 }
  
  validates :description, presence: true, length:  { maximum: 1000 }

  validates :status,:cost, :days,:prefecture_id, presence: true

  validates :price, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 ,allow_blank: true}
end

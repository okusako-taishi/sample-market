class Item < ApplicationRecord

  belongs_to :user
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true , length: { maximum: 10 }

  belongs_to :category

  has_many :favorites
  has_many :users, through: :favorites

  belongs_to :brand ,optional: true 
  accepts_nested_attributes_for :brand

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :name, presence: true, length:  { maximum: 40 }
  
  validates :description, presence: true, length:  { maximum: 1000 }

  validates :status,:cost, :days,:prefecture_id, presence: true

  validates :price, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 ,allow_blank: true}
end

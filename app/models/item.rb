class Item < ApplicationRecord
  belongs_to :user

  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  # belongs_to :category

  belongs_to :brand ,optional: true 
  accepts_nested_attributes_for :brand

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :name,:price,:description,:status,:cost, :days,:prefecture_id, presence: true

end

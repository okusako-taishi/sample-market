class User < ApplicationRecord
  has_one :card, dependent: :destroy
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments



  # validates :nickname, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana,:birth_day,  presence: true

  has_one :destination , dependent: :destroy

  validates :nickname,  presence: true

  validates :family_name,presence: true,
                 format: {
                   with:  /\A[ ぁ-んァ-ヶー一-龠      ]+\z/,
                   message: "全角で入力して下さい",
                   allow_blank: true
                   }
  validates :first_name, presence: true,
                 format: {
                   with:  /\A[ ぁ-んァ-ヶー一-龠      ]+\z/,
                   message: "全角で入力して下さい",
                   allow_blank: true
                 }
  validates :family_name_kana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナで入力して下さい",
                   allow_blank: true
                 } 
  validates :first_name_kana, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナで入力して下さい",
                   allow_blank: true
                 }

  validates :birth_day, presence: true


end


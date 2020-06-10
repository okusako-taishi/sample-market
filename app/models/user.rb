class User < ApplicationRecord
  has_one :card
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, :email, :encrypted_password, :family_name, :first_name, :family_name_kana, :first_name_kana,:birth_day,  presence: true

  has_one :destination

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


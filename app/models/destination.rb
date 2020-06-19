class Destination < ApplicationRecord

  belongs_to :user  ,optional: true 

  validates :family_name, presence: true,
                 format: {
                    with:  /\A[ ぁ-んァ-ヶー一-龠      ]+\z/,
                    message: "全角で入力して下さい",
                    allow_blank: true
                 }
  validates :first_name,presence: true,
                 format: {
                    with:  /\A[ ぁ-んァ-ヶー一-龠      ]+\z/,
                    message: "全角で入力して下さい",
                    allow_blank: true

                 }
  validates :family_name_kana,presence: true,
                 format: {
                    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                    message: "全角カタカナで入力して下さい",
                    allow_blank: true

                 } 
  validates :first_name_kana,presence: true,
                 format: {
                    with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                    message: "全角カタカナで入力して下さい",
                    allow_blank: true
                 }

  validates :post_code,presence: true,
                 format: {
                    with: /\A\d{7}\z/,
                    message: "ハイフンなしの7桁で入力して下さい",
                    allow_blank: true
                 }

  validates :prefecture_id ,:city,:block, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end



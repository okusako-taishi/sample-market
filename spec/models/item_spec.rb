require 'rails_helper'

describe 'Item' do
  describe '#create' do

    it "必須項目が全て記入されている場合は出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "ユーザーIDがない場合は出品できない" do
      item = build(:item, user_id: nil)
      expect(item).to be_invalid
    end

    it "画像がない場合は出品できない" do
      item = build(:item_without_image)
      item.valid?
      expect(item.errors[:images]).to include("を入力してください")
    end

    it "nameがない場合は出品できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "priceがない場合は出品できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "descriptionがない場合は出品できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "statusがない場合は出品できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "costがない場合は出品できないこと" do
      item = build(:item, cost: nil)
      item.valid?
      expect(item.errors[:cost]).to include("を入力してください")
    end

    it "daysがない場合は出品できないこと" do
      item = build(:item, days: nil)
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end

    it "prefecture_idがない場合は出品できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "category_idがない場合は出品できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "nameが40字の場合は出品できる" do
      item = build(:item ,name: "#{"a"*40}")
      expect(item).to be_valid
    end

    it "nameが41字の場合は出品できない" do
      item = build(:item ,name: "#{"a"*41}")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "descriptionが1000字の場合は出品できる" do
      item = build(:item ,description: "#{"a"*1000}")
      expect(item).to be_valid
    end

    it "descriptionが1001字の場合は出品できない" do
      item = build(:item ,description: "#{"a"*1001}")
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "priceが299円の場合は出品できないこと" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが300円の場合は出品できること" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end

    it "priceが9999999円の場合は出品できること" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end

    it "priceが10000000円の場合は出品できないこと" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "imageが10枚の場合は出品できる" do
      item = build(:item_with_10_image)
      expect(item).to be_valid
    end

    it "imageが11枚の場合は出品できない" do
      item = build(:item_with_11_image)
      expect(item).to be_invalid
    end

  end

end
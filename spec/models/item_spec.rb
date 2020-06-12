require 'rails_helper'

describe Item do
  describe '#create' do

    # it "name, price, description, status, size, days, cost, prefecture_id, category_id, user_idが存在すれば登録できること" do
    #   user = create(:user)
    #   category = create(:category)
    #   item = build(:item, user_id: user[:id], category_id: category[:id])
    #   expect(item).to be_valid
    # end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "costがない場合は登録できないこと" do
      item = build(:item, cost: nil)
      item.valid?
      expect(item.errors[:cost]).to include("を入力してください")
    end

    it "daysがない場合は登録できないこと" do
      item = build(:item, days: nil)
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

  end

end
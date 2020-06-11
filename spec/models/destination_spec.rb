require 'rails_helper'



RSpec.describe Destination, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#create' do

  it "family_name、first_name、family_name_kana、first_name_kana、post_code、prefecture_id、cityが存在すれば登録できること" do
    destination = build(:destination, building_name: nil, phone_number: nil)
    expect(destination).to be_valid
  end

  it "family_nameがない場合は登録できないこと" do
    destination = build(:destination, family_name: nil)
    destination.valid?
    expect(destination.errors[:family_name]).to include("を入力してください")
  end

  it "firts_nameがない場合は登録できないこと" do
    destination = build(:destination, first_name: nil)
    destination.valid?
    expect(destination.errors[:first_name]).to include("を入力してください")
  end

  it "family_name_kanaがない場合は登録できないこと" do
    destination = build(:destination, family_name_kana: nil)
    destination.valid?
    expect(destination.errors[:family_name_kana]).to include("を入力してください")
  end

  it "first_name_kanaがない場合は登録できないこと" do
    destination = build(:destination, first_name_kana: nil)
    destination.valid?
    expect(destination.errors[:first_name_kana]).to include("を入力してください")
  end

  it "post_codeがない場合は登録できないこと" do
    destination = build(:destination, post_code: nil)
    destination.valid?
    expect(destination.errors[:post_code]).to include("を入力してください")
  end

  it "post_codeが6文字以下の場合は登録できないこと" do
    destination = build(:destination, post_code: "111111")
    destination.valid?
    expect(destination.errors[:post_code]).to include("ハイフンなしの7桁で入力して下さい")
  end

  it "post_codeが8文字以上の場合は登録できないこと" do
    destination = build(:destination, post_code: "11111111")
    destination.valid?
    expect(destination.errors[:post_code]).to include("ハイフンなしの7桁で入力して下さい")
  end

  it "family_nameが全角でない場合は登録できないこと" do
    destination = build(:destination, family_name: "yamada")
    destination.valid?
    expect(destination.errors[:family_name]).to include("全角で入力して下さい")
  end

  it "first_nameが全角でない場合は登録できないこと" do
    destination = build(:destination, first_name: "tarou")
    destination.valid?
    expect(destination.errors[:first_name]).to include("全角で入力して下さい")
  end

  it "family_name_kanaが全角カタカナでない場合は登録できないこと" do
    destination = build(:destination, family_name_kana: "やまだ")
    destination.valid?
    expect(destination.errors[:family_name_kana]).to include("全角カタカナで入力して下さい")
  end
  
  it "first_name_kanaが全角カタカナでない場合は登録できないこと" do
    destination = build(:destination, first_name_kana: "たろう")
    destination.valid?
    expect(destination.errors[:first_name_kana]).to include("全角カタカナで入力して下さい")
  end

  it "prefecture_idがない場合は登録できないこと" do
    destination = build(:destination, prefecture_id: nil)
    destination.valid?
    expect(destination.errors[:prefecture_id]).to include("を入力してください")
  end

  it "cityがない場合は登録できないこと" do
    destination = build(:destination, city: nil)
    destination.valid?
    expect(destination.errors[:city]).to include("を入力してください")
  end

  it "blockがない場合は登録できないこと" do
    destination = build(:destination, block: nil)
    destination.valid?
    expect(destination.errors[:block]).to include("を入力してください")
  end

  end
end

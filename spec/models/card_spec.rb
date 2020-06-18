require 'rails_helper'
describe Card do
  describe '#create' do
    it "外部キーのuser_idがあれば、登録ができること" do
      user = create(:user)
      card = build(:card, user_id: user.id)
      expect(card).to be_valid
    end

    it "外部キーのuser_idが無い場合、登録が出来ないこと" do
      card = build(:card)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end
  end
end

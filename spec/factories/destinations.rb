FactoryBot.define do
  factory :destination do
    
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    post_code             {"1111111"}
    prefecture_id         {"00"}
    city                  {"東京都"}
    block                 {"新宿区"}
    building_name         {"aa"}
    phone_number          {"00000000000"}
  end
end

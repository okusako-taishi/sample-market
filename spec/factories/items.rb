FactoryBot.define do

  factory :item do
    name               {"item"}
    price              {"100"}
    description        {"aaa"}
    status             {"aaa"}
    size               {"aaa"}
    cost               {"aaa"}
    days               {"aaa"}
    prefecture_id      {"1"}
    category_id        {"111"}
    # brand_id           {"1"}
    user_id            {"1"}
  end

  factory :category do
    name              {"aaa"}
  end



end
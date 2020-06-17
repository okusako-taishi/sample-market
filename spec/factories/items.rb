FactoryBot.define do

  factory :item do
    name               {"item"}
    price              {"350"}
    description        {"aaa"}
    status             {"aaa"}
    size               {"aaa"}
    cost               {"aaa"}
    days               {"aaa"}
    prefecture_id      {"1"}
    category_id        {"1"}
    user_id            {"1"}
    saler_id           {"1"}
    user
    category
    after(:build) do |item|
      item.images << build(:image, item: item) 
    end
  end

  factory  :item_without_image,class:Item do
    name               {"item"}
    price              {"1000"}
    description        {"aaa"}
    status             {"aaa"}
    size               {"aaa"}
    cost               {"aaa"}
    days               {"aaa"}
    prefecture_id      {"1"}
    category_id        {"1"}
    saler_id           {"1"}
    user
    category

  end

  factory  :item_with_10_image,class:Item do
    name               {"item"}
    price              {"1000"}
    description        {"aaa"}
    status             {"aaa"}
    size               {"aaa"}
    cost               {"aaa"}
    days               {"aaa"}
    prefecture_id      {"1"}
    category_id        {"1"}
    saler_id           {"1"}
    user
    category

    after(:build) do |item|
      item.images << build_list(:image,10,item: item)
    end
  end

  factory  :item_with_11_image,class:Item do
    name               {"item"}
    price              {"1000"}
    description        {"aaa"}
    status             {"aaa"}
    size               {"aaa"}
    cost               {"aaa"}
    days               {"aaa"}
    prefecture_id      {"1"}
    category_id        {"1"}
    saler_id           {"1"}
    user
    category

    after(:build) do |item|
      item.images << build_list(:image,11,item: item)
    end
  end

end
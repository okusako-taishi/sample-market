FactoryBot.define do

  factory :image do
    url    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image.jpg'))}
    item_id   {"4"}
    association :item
  end

end
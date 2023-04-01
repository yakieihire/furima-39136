FactoryBot.define do
  factory :item do
    item_name          {'test'}
    description        {'test'}
    category_id        {2}
    situation_id       {2}
    shipping_payer_id  {2}
    prefecture_id      {2}
    shipping_day_id    {2}
    price              {2000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

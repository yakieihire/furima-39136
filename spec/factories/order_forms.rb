FactoryBot.define do
  factory :order_form do
    post_code              { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id          { 2 }
    municipality           { '市町村' }
    address                { '1-1' }
    building_name          { '建物' }
    telephone_number       { '00011112222' }
  end
end

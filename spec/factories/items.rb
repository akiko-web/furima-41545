FactoryBot.define do
    factory :item do
      item_name         { Faker::Commerce.product_name }
      description       { Faker::Lorem.paragraph }
      category_id       { Faker::Number.between(from: 1, to: 10) }
      condition_id      { Faker::Number.between(from: 1, to: 6) }
      shipping_fee_id   { Faker::Number.between(from: 1, to: 2) }
      region_id         { Faker::Number.between(from: 1, to: 47) }
      delivery_time_id  { Faker::Number.between(from: 1, to: 3) }
      price             { Faker::Number.between(from: 300, to: 9999999) }
      association :user
    end
  end

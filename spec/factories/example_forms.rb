FactoryBot.define do
  factory :example_form do
    postal_code        { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    region_id          { Faker::Number.between(from: 1, to: 47) }
    city               { Faker::Address.city }
    address_number     { Faker::Address.street_address }
    building_name      { Faker::Address.building_number }
    phone_number       { Faker::Number.leading_zero_number(digits: 11) }
    token              { 'tok_' + Faker::Alphanumeric.alpha(number: 24) } # PAY.JPトークンのダミーデータ
    association :user  # 関連するユーザー
    association :item  # 関連するアイテム
  end
end

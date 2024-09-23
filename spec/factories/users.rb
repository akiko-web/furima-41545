FactoryBot.define do
  factory :user do
    nickname { '鈴木' }
    email { Faker::Internet.unique.email }
    password { 'test1234' }
    password_confirmation { password }
    first_name { 'スズキ' }
    last_name { 'スズキ' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'スズキ' }
    birth_date { '1930-02-01' }
  end
end

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | 	date  | null: false |

### Association
- has_many : items
- has_many : item_records

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| description        | text   | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_fee_id    | integer | null: false |
| region_id          | integer | null: false |
| delivery_time_id   | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true | 

### Association
- has_one :item_record
- belongs_to :user

## item_records テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | 	string | null: false |
| region_id          | integer | null: false |
| city               | string | null: false |
| address_number     | string | null: false |
| building_name      | string | |
| phone_number       | string | null: false |
| items_record   | references | null: false, foreign_key: true |


### Association
- belongs_to :item_records






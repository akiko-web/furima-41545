class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :delivery_time
  belongs_to :region
  belongs_to :category
  
  has_one_attached :image  
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  # presence: true必須
  validates :item_name,     presence: true
  validates :description,   presence: true
  validates :image,   presence: true
  validates :price, presence: true, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: 'は300円から9,999,999円の間で設定してください' 
  }
  validates :delivery_time_id, presence: true, numericality: { other_than: 0, message: "を選択してください" }
  validates :category_id,     presence: true, numericality: { other_than: 0, message: "を選択してください" }
  validates :region_id,       presence: true, numericality: { other_than: 0, message: "を選択してください" }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 0, message: "を選択してください" }
  validates :condition_id,    presence: true, numericality: { other_than: 0, message: "を選択してください" }

end

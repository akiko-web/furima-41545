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
  validates :delivery_time_id, presence: true, numericality: { other_than: 0, message: "を選択してください" }

end

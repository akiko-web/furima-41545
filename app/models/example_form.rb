  class ExampleForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :address_number, :building_name, :phone_number , :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含めた正しい形式で入力してください' }
    validates :region_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の半角数字で入力してください' }
    validates :token
    validates :user_id
    validates :item_id
  end

    def save
      # 購入情報を保存
      item_record = ItemRecord.create(user_id: user_id, item_id: item_id) 
      
      # 配送先情報を保存
      Address.create(
        item_record_id: item_record.id,
        postal_code: postal_code,
        region_id: region_id,
        city: city,
        address_number: address_number,
        building_name: building_name,
        phone_number: phone_number
      )
    end
  end
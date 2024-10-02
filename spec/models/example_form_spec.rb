require 'rails_helper'

RSpec.describe ExampleForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @example_form = FactoryBot.build(:example_form, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@example_form).to be_valid
      end

      it '建物名が空でも保存できること' do
        @example_form.building_name = ''
        expect(@example_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @example_form.postal_code = ''
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが正しい形式でないと保存できない（例: 123-4567）' do
        @example_form.postal_code = '1234567'
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include('Postal code はハイフンを含めた正しい形式で入力してください')
      end

      it 'region_idが0の場合は保存できない（選択されていない状態）' do
        @example_form.region_id = 0
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include('Region を選択してください')
      end

      it 'cityが空だと保存できない' do
        @example_form.city = ''
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("City can't be blank")
      end

      it 'address_numberが空だと保存できない' do
        @example_form.address_number = ''
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("Address number can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @example_form.phone_number = ''
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満では保存できない' do
        @example_form.phone_number = '123456789'
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'phone_numberが12桁以上では保存できない' do
        @example_form.phone_number = '123456789012'
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'phone_numberにハイフンが含まれていると保存できない' do
        @example_form.phone_number = '123-4567-8901'
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'tokenが空では保存できない' do
        @example_form.token = ''
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存できない' do
        @example_form.user_id = nil
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できない' do
        @example_form.item_id = nil
        @example_form.valid?
        expect(@example_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

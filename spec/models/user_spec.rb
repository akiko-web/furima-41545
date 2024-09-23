require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_nameが空だと保存できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角日本語でないと保存できないこと' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_name_kanaが空だと保存できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナでないと保存できないこと' do
        @user.first_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it 'last_name_kanaが空だと保存できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナでないと保存できないこと' do
        @user.last_name_kana = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
      end
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end
end

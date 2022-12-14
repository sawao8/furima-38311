require 'rails_helper'

RSpec.describe OrderAddress, type: :model do 

  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.5)
    end

  
    context '配送先情報の保存ができるとき' do
      it 'すべての値が入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '配送先の情報が保存できないとき' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_address.post_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県が「---」だと保存できない' do
        @order_address.sender_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Sender area can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @order_address.sender_area_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Sender area can't be blank")
      end
      it '市町村が空だと保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_address.phone_number = '123-4567-8910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @order_address.phone_number = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

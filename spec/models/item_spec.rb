require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep 0.1
  end

  describe '商品の出品登録' do
    context '商品の出品登録ができるとき' do
      it 'name,item_content,category,condition,cost,sender_area,delivery_time,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品登録ができないとき' do
      it 'ユーザー登録していないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だ出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.item_content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item content can't be blank")
      end
      it 'カテゴリーが空欄だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空欄だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空欄だと登録できない' do
        @item.cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '発送元の地域が空欄だと登録できない' do
        @item.sender_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area can't be blank")
      end
      it '発送までの日数が空欄だと登録できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格が空欄だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が300円未満だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が9,999,999円を超えると出品ができない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が全角だと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end

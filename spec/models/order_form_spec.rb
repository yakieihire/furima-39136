require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての項目の入力が存在していれば購入出来る' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ購入できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'teim_idが空でなければ購入できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列の組み合わせであれば購入できる' do
        @order_form.post_code = '123-1234'
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ購入できる' do
        @order_form.municipality = '市区町村'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ購入できる' do
        @order_form.address = '1-1'
        expect(@order_form).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしで購入できる' do
        @order_form.telephone_number = '00011112222'
        expect(@order_form).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'user_idが空では購入できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空のとき購入できない' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角ハイフンが含まれていない場合、購入できない' do
        @order_form.post_code = '0001111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が未選択のとき購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空のとき購入できない' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空のとき購入できない' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空のとき購入できない' do
        @order_form.telephone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下は購入できない' do
        @order_form.telephone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が10桁以上11桁以下の半角数字でないと購入できない' do
        @order_form.telephone_number = '123456678９0'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'トークンが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

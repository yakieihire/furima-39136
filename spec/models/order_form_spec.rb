require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '全ての項目の入力が存在していれば購入出来る' do
        expect(@order_form).to be_valid
      end
      it '建物名がなくても保存できる' do
        @order_form.building_name = ''
      end
    end
    context '商品が出品できないとき' do
      it '郵便番号が空のとき' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it '都道府県が未選択のとき' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空のとき' do
        @order_form.municipality = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空のとき' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空のとき' do
        @order_form.telephone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
    end
  end
end

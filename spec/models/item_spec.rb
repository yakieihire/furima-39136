require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '全ての項目の入力が存在していれば出品出来る' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'カテゴリーが未選択では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは空白にしないでください")
      end
      it '商品の状態が未選択では出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は空白にしないでください")
      end
      it '発送料の負担が未選択では出品できない' do
        @item.shipping_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料をどちらが負担するかは空白にしないでください")
      end
      it '発送元の地域が未選択では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("都道府県は空白にしないでください")
      end
      it '発送までの日数が未選択では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は空白にしないでください")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '価格が全角数字では出品できない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は数値で入力してください")
      end
      it '価格が300円以下では出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は300以上の値にしてください")
      end
      it '価格が9_999_999以上は出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は9999999以下の値にしてください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

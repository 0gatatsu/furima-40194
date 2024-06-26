require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,image,price,content,genre_id,quality_id,payment,_id,prefecture_id,day_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'contentが空では保存できないこと' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'genre_idが空では保存できないこと' do
        @item.genre_id = { other_than: 0 }
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'quality_idが空では保存できないこと' do
        @item.quality_id = { other_than: 0 }
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'payment_idが空では保存できないこと' do
        @item.payment_id = { other_than: 0 }
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'prefecture_idが空では保存できないこと' do
        @item.prefecture_id = { other_than: 0 }
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_idが空では保存できないこと' do
        @item.days_id = { other_than: 0 }
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

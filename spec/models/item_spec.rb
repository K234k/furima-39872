require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: user)
  end

  describe '商品出品登録' do
    context '出品登録ができる時' do
      it '全ての入力事項が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像が添付されていないと出品できない' do
        @item.image = nil # 画像を空に設定
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空白だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空白だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品名が41文字以上だと出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it '商品の説明が1001文字以上だと出品できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      it '価格が空白だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が数値でないと出品できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10,000,000円以上だと出品できない' do
       @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

     it 'カテゴリーが「0」だと出品できない' do
      @item.category_id = 0
      @item.valid?
     expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it '商品の状態が「0」だと出品できない' do
      @item.item_status_id = 0
      @item.valid?
     expect(@item.errors.full_messages).to include("Item status must be other than 0")
    end
   it '配送料の負担が「0」だと出品できない' do
     @item.shipping_cost_id = 0
     @item.valid?
     expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
    end

  it '配送元の地域が「0」だと出品できない' do
    @item.prefecture_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
   end

   it '配送までの日数が「0」だと出品できない' do
    @item.shipping_date_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping date must be other than 0")
   end
   end
  end
 end
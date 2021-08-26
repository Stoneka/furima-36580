require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.3
  end
describe '商品購入機能' do

  context '商品が購入できるとき' do
    it 'すべての値が正しく入力されていれば購入情報が登録できる' do
      expect(@order_shipping).to be_valid
    end
    it 'postal_codeは空でなければ登録できる' do
      @order_shipping.postal_code = '000-0000'
      expect(@order_shipping).to be_valid
    end
    it 'shipment_source_idは空でなければ登録できる' do
      @order_shipping.shipment_source_id = 2
      expect(@order_shipping).to be_valid
    end
    it 'cityは空でなければ登録できる' do
      @order_shipping.city = '大阪市'
      expect(@order_shipping).to be_valid
    end
    it 'blockは空でなければ登録できる' do
      @order_shipping.block = '大阪市'
      expect(@order_shipping).to be_valid
    end
    it 'buildingは空でも登録できる' do
      @order_shipping.building = ''
      expect(@order_shipping).to be_valid
    end
    it 'phoneは空でなければ登録できる' do
      @order_shipping.phone = '12312341234'
      expect(@order_shipping).to be_valid
    end
    it "tokenが空でなければ登録できる" do
      @order_shipping.token = "tok_abcdefghijk00000000000000000"
      expect(@order_shipping).to be_valid
    end
  end

  context '商品の購入ができないとき' do
    it 'postal_codeが空では登録できない' do
      @order_shipping.postal_code = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できない' do
      @order_shipping.postal_code = '1234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('郵便番号にはハイフンを含める必要があります')
    end
    it 'shipment_source_idが初期値では登録できない' do
      @order_shipping.shipment_source_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("都道府県を入力してください")
    end
    it 'cityが空では登録できない' do
      @order_shipping.city = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
    end
    it 'blockが空では登録できない' do
      @order_shipping.block = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
    end
    it 'phoneが空では登録できない' do
      @order_shipping.phone = ''
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください")
    end
    it 'phoneが半角数字以外では登録できない' do
      @order_shipping.phone = '１２３４５６７８９１０'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("電話番号は数値で入力してください")
    end
    it 'phoneが10桁未満では登録できない' do
      @order_shipping.phone = '123456789'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("電話番号は10文字以上で入力してください")
    end
    it 'phoneが12桁以上では登録できない' do
      @order_shipping.phone = '123456789012'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("電話番号は11文字以内で入力してください")
    end
    it 'user_idが紐づいていなければ登録できない' do
      @order_shipping.user_id = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("ユーザーを入力してください")
    end
    it 'item_idが紐づいていなければ登録できない' do
      @order_shipping.item_id = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("商品を入力してください")
    end
    it "tokenが空では登録できない" do
      @order_shipping.token = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
end
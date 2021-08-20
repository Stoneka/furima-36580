require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end



  describe '商品出品機能' do
    context '商品の出品ができるとき' do
      it 'image,item_name,explanation,category_id,status_id,
      burden_method_id,shipment_source_id,
      shipping_days_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'imageが空でなければ登録できる' do
        @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        expect(@item).to be_valid
      end
      it 'item_nameが空でなければ登録できる' do
        @item.item_name = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'expalanationが空でなければ登録できる' do
        @item.explanation = 'aaaaaa'
        expect(@item).to be_valid
      end
      it 'category_idが空でなければ登録できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'status_idが空でなければ登録できる' do
        @item.status_id = '2'
        expect(@item).to be_valid
      end
      it 'burden_method_idが空でなければ登録できる' do
        @item.burden_method_id = '2'
        expect(@item).to be_valid
      end
      it 'shipment_source_idが空でなければ登録できる' do
        @item.shipment_source_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_days_idが空でなければ登録できる' do
        @item.shipping_days_id = '2'
        expect(@item).to be_valid
      end
      it 'priceが空でないかつ300~9,999,999の間であれば登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end
  end
end
=begin
    context '商品の出品ができないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("item_name can't be blank")
      end
      it 'emailが空では登録できない' do
        @item.email = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まなければ登録できない' do
        @item.email = 'testtest'
        @item.valid?
        expect(@item.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @item.password = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @item.password_confirmation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @item.password = '0000a'
        @item.password_confirmation = '0000a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英字のみでは登録できない' do
        @item.password = 'abcdef'
        @item.password_confirmation = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @item.password = '123456'
        @item.password_confirmation = '123456'
        @item.valid?
        expect(@item.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @item.last_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @item.first_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @item.last_name = 'ABC'
        @item.valid?
        expect(@item.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @item.first_name = 'ABC'
        @item.valid?
        expect(@item.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @item.burden_method_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、名字がカタカナでなければ登録できない' do
        @item.status_id = '手酢'
        @item.valid?
        expect(@item.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
      end
      it 'お名前カナ(全角)は、名前がカタカナでなければ登録できない' do
        @item.burden_method_id = '都'
        @item.valid?
        expect(@item.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
      end
      it 'shipment_source_idが空では登録できない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("shipment_source_id can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @item.save
        another_item = FactoryBot.build(:item)
        another_item.email = @item.email
        another_item.valid?
        expect(another_item.errors.full_messages).to include('Email has already been taken')
      end
    end
  end

  item_name 
  explanation        
  category_id        
  status_id         
  burden_method_id  
  shipment_source_id 
  shipping_days_id  
  price              

  item_name,explanation,category_id,status_id,burden_method_id,shipment_source_id,shipping_days_id,price
bundle exec rspec spec/models/item_spec.rb
=end
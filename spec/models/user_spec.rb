require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,
    last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが空でなければ登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ半角英字1文字以上かつ半角数字1文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it 'last_nameが空でないかつ全角文字であれば登録できる' do
        @user.last_name = '手酢'
        expect(@user).to be_valid
      end
      it 'first_nameが空でないかつ全角文字であれば登録できる' do
        @user.first_name = '都'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが空でないかつ全角カナ文字であれば登録できる' do
        @user.last_name_kana = 'テス'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが空でないかつ全角カナ文字であれば登録できる' do
        @user.first_name_kana = 'ト'
        expect(@user).to be_valid
      end
      it 'birthdayが空でなければ登録できる' do
        @user.birthday = '20000101'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailに@を含まなければ登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'お名前(全角)は、名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'お名前(全角)は、名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'お名前(全角)は、名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角文字を使用してください')
      end
      it 'お名前(全角)は、名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'ABC'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角文字を使用してください')
      end
      it 'お名前カナ(全角)は、名字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、名字がカタカナでなければ登録できない' do
        @user.last_name_kana = '手酢'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カナ）は全角カナ文字を使用してください')
      end
      it 'お名前カナ(全角)は、名前がカタカナでなければ登録できない' do
        @user.first_name_kana = '都'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カナ文字を使用してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
    end
  end
end

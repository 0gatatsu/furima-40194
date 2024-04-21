require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとfirst_name_kanjiとlast_name_kanjiとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが同じなら登録できる' do
        @user.password = @user.password_confirmation
        expect(@user).to be_valid
      end
    end

  context '新規登録ができないとき' do
     it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'aaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaa00'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordに半角英字がなければ登録できない' do
      @user.password = '000000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordに半角数字がなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_name_kanjiが存在しなければ登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'last_name_kanjiが存在しなければ登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
    end
    it 'first_name_kanaが存在しなければ登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが存在しなければ登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanjiが全角入力でなければ登録できない' do
      @user.first_name_kanji = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji is invalid')
    end
    it 'last_name_kanjiが全角入力でなければ登録できない' do
      @user.last_name_kanji = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji is invalid')
    end
    it 'first_name_kanaが全角カタカナ入力でなければ登録できない' do
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'last_name_kanaが全角カタカナ入力でなければ登録できない' do
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
     it 'birthdayが存在しなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
  end
 end
end
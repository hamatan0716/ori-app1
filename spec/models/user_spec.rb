require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    
    context '新規登録できる' do
      it '全ての項目に正しく入力すると登録できる' do
        expect(@user).to be_valid
      end
      it 'プロフィールが未入力でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
      it 'プロフィール画像を選択しなくても登録できる' do
        @user.avatar = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'ニックネームが１3文字以上だと登録できない' do
        @user.nickname = 'abcdefghijklm'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 12 characters)")
      end
      it 'プロフィールが２００文字以上だと登録できない' do
        @user.profile = Faker::Lorem.characters(number: 201)
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile is too long (maximum is 200 characters)")
      end
      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは６文字以上でないと登録できない' do
        @user.password = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは英数字でないと登録できない' do
        @user.password = 'あああいいいううう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは英数字の両方を組み合わせないと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスに＠がないと登録できない' do
        @user.email = 'samplesample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end

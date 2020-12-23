require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail、passwordとpassword_confirmation、lastnameとfirstname、lastnamekanaとfirstnamekana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnamekanaが空では登録できない' do
        @user.lastnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana can't be blank")
      end
      it 'firstnamekanaが空では登録できない' do
        @user.firstnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Password can't be blank")
      end

      it 'password:数字のみは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Password can't be blank")
      end
      it 'password:全角英数混合は登録できない' do
        @user.password = '１１１ｋｋｋ'
        @user.password_confirmation = '１１１ｋｋｋ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Password can't be blank")
      end
      it 'email：@がない場合は登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Last name can't be blank.")
      end
      it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. First name can't be blank.")
      end
      it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.lastnamekana = '亜あaA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana is invalid. Last name kana can't be blank.")
      end
      it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.firstnamekana = '亜あaA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana is invalid. First name kana can't be blank.")
      end
    end
  end
end

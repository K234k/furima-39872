require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる場合' do
      it '情報が正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードが６文字以上半角英数字であれば登録できる' do
        @user.password = 'abc987'
        @user.password_confirmation = 'abc987'
        expect(@user).to be_valid
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.last_name = '振真'
        expect(@user).to be_valid
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.first_name = '西都'
        expect(@user).to be_valid
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.last_name_kana = 'フリマ'
        expect(@user).to be_valid
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.first_name_kana = 'サイト'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくできない場合' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase 
        expect(duplicate_user.valid?).to be_falsey
      end
    
      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'invalid_email_example.com'
        expect(@user.valid?).to be_falsey
      end

      it 'パスワードと確認用パスワードが一致しないと登録できない' do
        @user.password_confirmation = 'ab987b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードと確認用パスワードが６文字以下だと登録できない' do
        @user.password_confirmation = 'ab987'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードと確認用パスワードが半角英数字でないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'onlyletters'
        expect(@user.valid?).to be_falsey
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '1234567890'
        expect(@user.valid?).to be_falsey
      end
    
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード１２３'
        expect(@user.valid?).to be_falsey
      end

      it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'saito'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '名字のフリガナが全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '名前のフリガナが全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'さいと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

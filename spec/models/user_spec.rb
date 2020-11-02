require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname,email,password,phone_number,detailが存在していれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@がないと登録できない" do
        @user.email = 'yamada.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できない" do
        @user.password = 'a0a0a'
        @user.password_confirmation = 'a0a0a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが英語のみだと登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが数字のみだと登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "phone_numberが空だと登録できない" do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以下だと保存できないこと' do
        @user.phone_number = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
      end
  
      it 'phone_numberが11桁以上だと保存できないこと' do
        @user.phone_number = '111111111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
      end
  
      it 'phone numberにハイフンが含まれていると保存できないこと' do
        @user.phone_number = '090-1111-1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
      end

      it 'detailが空だと登録できない' do
        @user.detail = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Detail can't be blank")
      end
    end
  end
end

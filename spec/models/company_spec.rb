require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.build(:company) 
  end

  describe '法人登録機能' do
    context '法人がうまく登録できる時' do
      it 'company_name, email, password, office_url, phone_number, staff_lastname_kana, staff_firstname_kana, detailが存在していれば登録できる' do
        expect(@company).to be_valid
      end
    end

    context '法人登録がうまくできない時' do
      it 'company_nameが空だと登録できない' do
        @company.company_name = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Company name can't be blank")
      end

      it 'emailが空だと登録できない' do
        @company.email = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@がないと登録できない" do
        @company.email = 'yamada.gmail.com'
        @company.valid?
        expect(@company.errors.full_messages).to include("Email is invalid")
      end

      it "emailが重複していると登録できない" do
        @company.save
        another_company = FactoryBot.build(:company)
        another_company.email = @company.email
        another_company.valid?
        expect(another_company.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空だと登録できない' do
        @company.password = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できない" do
        @company.password = 'a0a0a'
        @company.password_confirmation = 'a0a0a'
        @company.valid?
        expect(@company.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @company.password_confirmation = ''
        @company.valid?
        expect(@company.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが英語のみだと登録できない" do
        @company.password = 'abcdef'
        @company.password_confirmation = 'abcdef'
        @company.valid?
        expect(@company.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが数字のみだと登録できない" do
        @company.password = '123456'
        @company.password_confirmation = '123456'
        @company.valid?
        expect(@company.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'office_urlが空だと登録できない' do
        @company.office_url = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Office url can't be blank")
      end

      it 'office_urlが正しいURLでないと登録できない' do
        @company.office_url = 'aaa.com'
        @company.valid?
        expect(@company.errors.full_messages).to include("Office url は正しく入力してください")
      end

      it 'phone_numberが空だと登録できない' do
        @company.phone_number = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it 'staff_lastname_kanaが空だと登録できない' do
        @company.staff_lastname_kana = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff lastname kana can't be blank")
      end

      it 'staff_lastname_kanaが半角入力の場合登録できない' do
        @company.staff_lastname_kana = 'yamada'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff lastname kana 全角カタカナで入力してください")
      end

      it 'staff_lastname_kanaが漢字の場合登録できない' do
        @company.staff_lastname_kana = '山田'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff lastname kana 全角カタカナで入力してください")
      end

      it 'staff_lastname_kanaがひらがなの場合登録できない' do
        @company.staff_lastname_kana = 'やまだ'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff lastname kana 全角カタカナで入力してください")
      end

      it 'staff_firstname_kanaが空だと登録できない' do
        @company.staff_firstname_kana = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff firstname kana can't be blank")
      end

      it 'staff_firstname_kanaが半角入力の場合登録できない' do
        @company.staff_firstname_kana = 'tarou'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff firstname kana 全角カタカナで入力してください")
      end

      it 'staff_firstname_kanaが漢字の場合登録できない' do
        @company.staff_firstname_kana = '太郎'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff firstname kana 全角カタカナで入力してください")
      end

      it 'staff_firstname_kanaがひらがなの場合登録できない' do
        @company.staff_firstname_kana = 'たろう'
        @company.valid?
        expect(@company.errors.full_messages).to include("Staff firstname kana 全角カタカナで入力してください")
      end

      it 'detailが空だと登録できない' do
        @company.detail = nil
        @company.valid?
        expect(@company.errors.full_messages).to include("Detail can't be blank")
      end
    end
  end
end

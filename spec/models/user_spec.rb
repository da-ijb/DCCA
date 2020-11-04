require 'rails_helper'


describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = "aaaaaaasample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "a0000"
      @user.password_confirmation = "a0000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること(数字のみ)" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it "パスワードは、半角英数字混合での入力が必須であること(英字のみ)" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end  

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "a000000"
      @user.password_confirmation = "b111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")      
    end

  end
  
  describe '新規登録/本人情報確認' do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名字のみ)" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank",
      "Last name is invalid")
    end

    it "ユーザー本名は、名字と名前がそれぞれ必須であること(名前のみ)" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank","First name is invalid")
    end  

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字のみ)" do
      @user.last_name = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前のみ)" do
      @user.first_name = "ｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end  
    
    it "都道府県についての情報が必須であること" do
      @user.prefecture_id = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")     
    end

    it "都道府県についての情報1以外が必須であること" do
      @user.prefecture_id = 1
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture must be other than 1")     
    end  

    it "商品の説明が必須であること" do
      @user.introduction = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Introduction can't be blank")     
    end  
  end 
end

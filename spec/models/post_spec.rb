require 'rails_helper'

RSpec.describe Post do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '保護犬保護猫の情報を入力' do
    it "画像を1枚つけることが必須であること" do
     @post.image = nil
     @post.valid?
     expect(@post.errors.full_messages).to include("Image can't be blank")
    end  
    
    it "名前が必須であること" do
      @post.name = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Name can't be blank")     
    end  
    
    it "説明が必須であること" do
      @post.description = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Description can't be blank")     
    end  
    
    it "種別の情報が必須であること" do
      @post.kind_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Kind can't be blank")     
    end

    it "種別の情報1以外が必須であること" do
      @post.kind_id = 1
      @post.valid?     
      expect(@post.errors.full_messages).to include("Kind must be other than 1")     
    end 
    
    it "性別についての情報が必須であること" do
      @post.gender_id = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Gender can't be blank")     
    end

    it "性別についての情報1以外が必須であること" do
      @post.gender_id = 1
      @post.valid?
      expect(@post.errors.full_messages).to include("Gender must be other than 1")     
    end  
  end  
end

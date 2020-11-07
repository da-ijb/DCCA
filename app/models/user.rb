class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :posts, dependent: :destroy
  has_many :comments
  belongs_to_active_hash :prefecture   
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post   
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  with_options presence: true do       
    validates :nickname
    validates :introduction

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :last_name
    validates :first_name
    end

    with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } do
    validates :password
    end     

    with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    end     
  end 

end

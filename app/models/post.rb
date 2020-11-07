class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :kind
  belongs_to_active_hash :gender
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  with_options presence: true do       
    validates :name
    validates :description
    validates :image

    with_options numericality: { other_than: 1 } do
    validates :kind_id
    validates :gender_id
    end     
  end 
end

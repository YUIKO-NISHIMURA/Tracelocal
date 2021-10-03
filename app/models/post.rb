class Post < ApplicationRecord
  validates :name, presence:true
  belongs_to :user
  has_many :reverses_of_favorite, class_name:"Favorite", dependent: :destroy
  has_many :like_users, through: :reverses_of_favorite, source: :user, dependent: :destroy
  mount_uploader :image, ImageUploader #写真投稿用
end

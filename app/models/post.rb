class Post < ApplicationRecord
  validates :name, presence:true
  belongs_to :user
  has_many :reverses_of_favorite, class_name:"Favorite", dependent: :destroy
  has_many :like_users, through: :reverses_of_favorite, source: :user, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end

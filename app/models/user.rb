class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :city, presence: true
  validates :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  
  has_many :posts, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow, dependent: :destroy
  has_many :reverses_of_relationship, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :like_posts, through: :favorites, source: :post, dependent: :destroy
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end 
  end 
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end 
  
  def feed_posts
    Post.where(user_id: self.following_ids)
  end 
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end 
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite 
  end 
  
  def favorite?(post)
    self.like_posts.include?(post)
  end 
end

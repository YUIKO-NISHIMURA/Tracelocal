class Image < ApplicationRecord
  belongs_to :post
  validates :image_url, presence: true
  mount_uploader :image_url, ImageUploader #写真投稿用
  
end

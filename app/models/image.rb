class Image < ActiveRecord::Base
  has_many :image_users
  has_many :users, through: :image_users 
  
  mount_uploader :picture, ImageUploader
  
  validates :picture, presence: true
  validates :user_ids, presence: true
  

end 

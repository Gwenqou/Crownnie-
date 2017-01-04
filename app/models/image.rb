class Image < ActiveRecord::Base
 
  has_many :image_users, dependent: :destroy
  has_many :users, through: :image_users 
  has_many :image_user_categories, through: :image_users
  has_many :categories, through: :image_users

  accepts_nested_attributes_for :image_users, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :image_user_categories, reject_if: :all_blank, allow_destroy: true
  
  mount_uploader :picture, ImageUploader
  
  validates :picture,  presence: true
  validates_associated :image_users

end 

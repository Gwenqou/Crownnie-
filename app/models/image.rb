class Image < ActiveRecord::Base
 
  has_many :image_users, dependent: :destroy
  has_many :users, through: :image_users 
  has_many :image_user_categories, through: :image_users
  has_many :categories, through: :image_users
  has_many :image_wishlists, dependent: :destroy
  has_many :wishlists, through: :image_wishlists
  
  
  accepts_nested_attributes_for :image_users, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :image_user_categories, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :users
  
  mount_uploader :picture, ImageUploader
  
  VALID_DESCRIPTION_REGEX = /\A[A-Za-z\-'\s]*\z/ 
  validate :picture_size
  validates :picture,  presence: true
  validates :description, presence: true, 
                        length: {minimum:3, maximum:25},
                        format: {with: VALID_DESCRIPTION_REGEX}
                        
  validates_associated :image_users


  def picture_size
    errors[:picture] << "should be less than 2MB" if picture.size > 2000000 
  end 
end 

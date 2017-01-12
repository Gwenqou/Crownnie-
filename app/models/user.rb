class User < ActiveRecord::Base 
  
  has_many :image_users
  has_many :images, through: :image_users 
  has_many :menus, :dependent => :destroy
  has_one :wishlist
  
  accepts_nested_attributes_for :menus, allow_destroy: true

  mount_uploader :avatar, ImageUploader
  validates :username, presence: true, 
                        uniqueness: {case_sensitive:false}, 
                        length: {minimum:3, maximum:25}
                        
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                      
  validates :email, presence:true,
                    uniqueness: {case_sensitive:false}, 
                    length: {minimum:3, maximum:105},
                    format: {with: VALID_EMAIL_REGEX}
                    
   has_secure_password     
   
   geocoded_by :salon_location
   after_validation :geocode, :if => :salon_location_changed?
end 
class User < ActiveRecord::Base 
  
  has_many :image_users
  has_many :images, through: :image_users 
  has_one :profile, through: :user_id, dependent: :destroy
  
  accepts_nested_attributes_for :profile, :allow_destroy => true
  validates_associated :profile
  
  validates :username, presence: true, 
                        uniqueness: {case_sensitive:false}, 
                        length: {minimum:3, maximum:25}
                        
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                      
  validates :email, presence:true,
                    uniqueness: {case_sensitive:false}, 
                    length: {minimum:3, maximum:105},
                    format: {with: VALID_EMAIL_REGEX}
                    
   has_secure_password             
end 
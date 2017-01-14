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
   validates :password, length: { minimum: 5, maximum: 30 }, on: :create
   before_create {generate_token(:auth_token)}
   
   geocoded_by :salon_location
   after_validation :geocode, :if => :salon_location_changed?
   
  def generate_token(column)
     begin
      self[column] = SecureRandom.urlsafe_base64
     end while User.exists? (column = self[column])
  end 
   
end 
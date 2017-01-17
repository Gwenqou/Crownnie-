class User < ActiveRecord::Base 
  
  has_many :image_users, :dependent => :destroy
  has_many :images, through: :image_users, :dependent => :destroy
  has_many :menus, :dependent => :destroy
  has_one :wishlist, :dependent => :destroy 
  
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
   validates :password, length: { minimum: 5, maximum: 30 }, on: :update, :if => lambda{ !password.nil? }
   
   before_create {generate_token(:auth_token)}

   validate :avatar_size
   
   geocoded_by :salon_location
   after_validation :geocode, :if => :salon_location_changed?
   
   def send_password_reset
     generate_token(:password_reset_token)
     self.password_reset_sent_at = Time.zone.now
     save!
     UserMailer.password_reset(self).deliver_now
   end 
   
  def generate_token(column)
     begin
      self[column] = SecureRandom.urlsafe_base64
     end while User.exists? (column = self[column])
  end 
  
  def avatar_size
    errors[:avatar] << "should be less than 2MB" if avatar.size > 2000000
  end 
   
  extend FriendlyId
  friendly_id :username
  
end 
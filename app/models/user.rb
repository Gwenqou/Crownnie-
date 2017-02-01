class User < ActiveRecord::Base 
  
  has_many :image_users, :dependent => :destroy
  has_many :images, through: :image_users #, :dependent => :destroy
  has_many :menus, :dependent => :destroy
  has_one :wishlist, :dependent => :destroy 
  
  accepts_nested_attributes_for :menus, allow_destroy: true

  mount_uploader :avatar, AvatarUploader
  
  VALID_USER_REGEX = /\A[a-zA-Z0-9]*\z/
  validates :username, presence: true, 
                        uniqueness: {case_sensitive:false}, 
                        length: {minimum:3, maximum:18},
                        format: {with: VALID_USER_REGEX, message: 'should contain only letters and numbers'}
  
  before_save do
    self.email.downcase! if self.email
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence:true,
                    uniqueness: {case_sensitive:false}, 
                    length: {minimum:3, maximum:105},
                    format: {with: VALID_EMAIL_REGEX}
    
  VALID_NAME_REGEX = /\A[a-zA-Z\s]*\z/ 
  validates :first_name, format: {with: VALID_NAME_REGEX, message: 'should only contain letters'}, on: :update, :if => lambda{ !first_name.nil? }
  validates :last_name, format: {with: VALID_NAME_REGEX, message: 'should only contain letters'}, on: :update, :if => lambda{ !last_name.nil? }
  
  VALID_PRICE_REGEX = /\A[0-9\+]*\z/ 
  validates :w, length: {maximum: 4},
                        format: {with: VALID_PRICE_REGEX, message: 'price should only contain numbers and/or the plus sign'}, 
                        on: :update,
                        :if => lambda{ !w.nil? }
                        
  validates :c,length: {maximum: 4},
                        format: {with: VALID_PRICE_REGEX, message: 'price should only contain numbers and/or the plus sign'}, 
                        on: :update,
                        :if => lambda{ !c.nil? }
  
  validates :m, length: {maximum: 4},
                        format: {with: VALID_PRICE_REGEX, message: 'price should only contain numbers and/or the plus sign'}, 
                        on: :update,
                        :if => lambda{ !m.nil? }
  validates :u, length: {maximum: 4},
                        format: {with: VALID_PRICE_REGEX, message: 'price should only contain numbers and/or the plus sign'}, 
                        on: :update,
                        :if => lambda{ !u.nil? }
                        
  # presence: { message: "price is required" }
  
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
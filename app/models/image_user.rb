class ImageUser < ActiveRecord::Base 
  belongs_to :user
  belongs_to :image
  
  validates :user_id, presence:true
  
end 
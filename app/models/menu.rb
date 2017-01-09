class Menu < ActiveRecord::Base 
  belongs_to :user
  mount_uploader :menu, MenuUploader
  
end 
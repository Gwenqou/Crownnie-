class ImageUserCategory < ActiveRecord::Base
  belongs_to :image_user
  belongs_to :category
  

  
end 
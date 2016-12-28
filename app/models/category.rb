class Category < ActiveRecord::Base
  has_many :image_user_categories
  has_many :image_users, through: :image_user_categories
  
  
end 

class ImageUser < ActiveRecord::Base 
  belongs_to :user
  belongs_to :image
  
  has_many :image_user_categories
  has_many :categories, through: :image_user_categories
  
  accepts_nested_attributes_for :image_user_categories
  accepts_nested_attributes_for :categories

  

  validates :user_id, presence: true
  validates_associated :image_user_categories

 
end 
class ImageUser < ActiveRecord::Base 

  belongs_to :user
  belongs_to :image


  has_many :image_user_categories, dependent: :destroy
  has_many :categories, through: :image_user_categories
  
  accepts_nested_attributes_for :image_user_categories, allow_destroy: true
  accepts_nested_attributes_for :categories

  

  validates :user_id, presence: { message: "Please choose a stylist that performed on this hair" }
  validates_associated :image_user_categories
  validates :image_user_categories, :length => { :minimum => 1, message: 'You need to choose at least one service for each stylist' }

 
end 
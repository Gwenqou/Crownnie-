class ImageUserCategory < ActiveRecord::Base
  belongs_to :image_user
  belongs_to :category

  validates :category_id, presence: true
  
end 
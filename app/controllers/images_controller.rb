class ImagesController < ApplicationController
  
  before_action :set_image, only: [:show, :destroy, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]


  
  def new 
    @image = Image.new

  end
    
  
  def create 
    @image = Image.new(image_params)
    if @image.save
      flash[:success]="Image saved"
      redirect_to user_path(current_user)
    else 
      render'new'
    end 
  end 
  
  def edit

  end 
  
  def update
    if @image.update(image_params)
      flash[:success]="The image was updated successfully"
      redirect_to image_path(@image)
    else 
      render 'edit'
    end 
  end 
  
  def show 
  end 
  
  def index
    @images = Image.all  
  end
  
  def destroy
    if @image.destroy 
      flash[:notice]="image destroyed"
      redirect_to images_path
    else 
      redirect_to image_path(@image)
    end 
  end 
  
  private
  
  def image_params 
    params.require(:image).permit(:picture, image_users_attributes:[:id, :user_id, :_destroy, image_user_categories_attributes:[:id, :category_id, :_destroy]])
  end 
  
  
  def set_image
    @image =Image.find(params[:id]) 
  end 
  

end 



#1.times do
    #  image_user = @image.image_users.build 
     # 1.times{image_user.image_user_categories.build}
   # end
   
   
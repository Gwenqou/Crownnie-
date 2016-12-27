class ImagesController < ApplicationController
  
  before_action :set_image, only: [:show, :destroy, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]

  
  def new 
    @image = Image.new
  end 
  
  def create 
    @image = Image.new(image_params)
    if @image.save 
      flash[:notice]="Image saved"
      redirect_to image_path(@image)
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
    params.require(:image).permit(:picture)
  end 

  def set_image
    @image =Image.find(params[:id]) 
  end 
  

end 

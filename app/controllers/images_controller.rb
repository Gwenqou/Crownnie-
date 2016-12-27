class ImagesController < ApplicationController
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
  
  def show 
    @image =Image.find(params[:id]) 
  end 
  
  def index
    @images = Image.all  
  end
  
  def destroy
    @image =Image.find(params[:id]) 
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

end 

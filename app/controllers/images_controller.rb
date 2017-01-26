class ImagesController < ApplicationController
  
  before_action :set_image, only: [:show,:destroy, :edit, :update]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  
  def index
    #get all the images from the user's wishlist
    #and check with each image so that if an image is in the wishlist, the heart is filled in the index page
    if logged_in?
      @user = current_user
      @wishlist_index = []
      @user.wishlist.images.each do |image|
        @wishlist_index.append(image.id)
      end 
    end
    
    if params[:search].present?
      #this line get all the images from all the nearby users, thus there can be duplication 
      #if an image has two users, two of the same picture will come up and .distinct doesnt help
      #so i create an array that get all the image ids. and call uniq to filter out all the duplicat images
      @radius = params[:radius] || 5
      @images_by_users = User.near(params[:search], @radius, :select => "users.*, images.*").joins(:images)
      @images_list =[]
      @images_by_users.each do |image|
        @images_list.append(image.id)
      end 
      @images_list.uniq

      if params[:category].present?
        category = Category.where('lower(name) = ?', params[:category].downcase).first
        category_id = category.id unless category.nil?
        @images = Image.where(id: @images_list).joins(:categories).where(categories:{ id: category_id }).paginate(page: params[:page], per_page: 60)  
        
      else 
        @images = Image.where(id: @images_list).paginate(page: params[:page], per_page: 60)  
        
      end 
      
    else
      if params[:category].present?
        category = Category.where('lower(name) = ?', params[:category].downcase).first
        category_id = category.id unless category.nil?
        @images = Image.joins(:categories).where(categories: { id: category_id }).paginate(page: params[:page], per_page: 60)
      else 
        @images = Image.all.paginate(page: params[:page], per_page: 60) 
      end
    end 
  end
  
  
  
  def new 
    @image = Image.new
    1.times do
      image_user = @image.image_users.build 
      1.times{image_user.image_user_categories.build}
    end
  end
    
  
  def create 
    @image = Image.new(image_params)
    @image.pictureuploader = current_user.id
    if @image.save
      flash[:success]="Image saved"
      redirect_to user_path(current_user)
    else 
      flash.now[:danger] = 'Please make sure that: <br/>'
      if(params[:image][:picture].nil?)
        flash.now[:danger] << "* Picture is not blank.<br/>"
      end
      if(params[:image][:description].empty?)
        flash.now[:danger] << "* Picture Caption is present.<br/>"
      end
      if(!params[:image][:description].empty?)
        flash.now[:danger] << "* Caption is between 3-25 characters. <br/>"
        flash.now[:danger] << "* Caption should contain only letters, single quotes, spaces and dashes <br/>"
      end 
      
      if(params[:image][:image_user_attributes].nil?)
        flash.now[:danger] << "* At least one stylist that performed on this hair is chosen.<br/>"
        flash.now[:danger] << "* At least one service is selected for each stylist."
      end
      render 'new'
    end 
  end 
  
  def edit

  end 
  
  def update
    if @image.update(image_params)
      flash[:success]="The image was updated successfully"
      redirect_to :back
    else 
      flash.now[:danger] = 'Please make sure that: <br/>'
      if(!params[:image][:description].empty?)
        flash.now[:danger] << "* Caption is between 3-25 characters. <br/>"
        flash.now[:danger] << "* Caption should contain only letters, single quotes, spaces and dashes. <br/>"
      end 
      if(params[:image][:image_user_attributes].nil?)
        flash.now[:danger] << "* At least one stylist that performed on this hair is chosen.<br/>"
        flash.now[:danger] << "* At least one service is selected for each stylist."
      end
      render 'edit'
    end 
  end 
  
  def show 
    if logged_in?
      @user = current_user
      @wishlist_index = []
      @user.wishlist.images.each do |image|
        @wishlist_index.append(image.id)
      end 
    end
  end 
  
  
  def destroy
    respond_to do |format|
      if @image.destroy 
        @image.image_wishlists.each do |iw|
            iw.destroy()
        end 
        format.html { redirect_to :back, flash[:success] = "Image was successfully deleted" }
        format.js 
      else 
        format.html { redirect_to :back, flash[:danger] = "something went wrong" }
      end 
    end 
  end 
  
  # def delete_picture_from_s3
  #   key = params[:picture_url].split('amazonaws.com/')[1]
  #   S3_BUCKET.object(params[key]).delete
  #   return true
  #   rescue => e
  #     return true
  # end

    
  private
  
  def image_params 
    params.require(:image).permit(:picture, :picture_cache, :description, image_users_attributes:[:id, :user_id, :_destroy, image_user_categories_attributes:[:id, :category_id, :_destroy]])
  end 
  
   
  
  def set_image
    @image =Image.find(params[:id]) 
  end 
  
  def require_same_user
    @image_user = []
    @image.users.each do |user|
      @image_user.append(user.id)
    end 
    
    if !@image_user.include?(current_user.id) && @image.pictureuploader != current_user.id && !current_user.admin
      flash[:danger] = "You can only edit your own picture"
      redirect_to user_path(current_user)
    end 
  end 
  
end 




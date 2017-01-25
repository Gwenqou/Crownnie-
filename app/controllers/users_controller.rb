class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :require_user, only: [:index, :locationmap,:edit, :update, :show, :add_to_wishlist ]
  before_action :require_same_user, only: [:edit, :update, :show]
  before_action :require_admin, only: [:index, :locationmap]
  
  def stylist_detail
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end 
  end 
  
  def new 
    @user = User.new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save
      @user.wishlist = Wishlist.new
      #session[:user_id]=@user.id
      cookies[:auth_token] = @user.auth_token
      flash[:success] = "Welcome to Crownshot"
      redirect_to user_path(@user)
    else
      if @user.is_stylist? 
        render "become_a_stylist"
      else 
        render "new"
      end 
    end 
  end 
  
  
  def become_a_stylist 
    @user = User.new
  end 
  
  def edit 
  end 
  
  def update 
    if @user.update(user_params_update)
        flash[:success] = 'Your profile was updated successfully'
        redirect_to edit_user_path(@user)
    else
      render 'edit'
    end 
   
  end 

  def show
    @stylist_images = @user.images.paginate(page: params[:page], per_page: 30)
    @general_images = Image.where(pictureuploader: @user.id).paginate(page: params[:page], per_page: 30)
  end 
  
  def index
    @users = User.all.order(:id)
  end 
  
  def add_to_wishlist
    @user = current_user
    @image = Image.find(params[:id])
    if !@user.wishlist.images.exists?(@image.id)
      @user.wishlist.images << @image
    end 
    respond_to do |format|
      format.html { flash[:success] = "Image was successfully saved in your wishlist" }
      format.js
    end 

  end 
  
  def destroy 
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.destroy()
        Image.where(pictureuploader: @user.id).each do |image|
          image.destroy()
        end 
        format.html { redirect_to :back, flash[:success] = "User was successfully deleted" }
        format.js
      else 
        format.html { redirect_to :back, flash[:danger] = "User was not deleted successfully" }
      end 
    end 
  end 
  
  def locationmap
    @users = User.where(is_stylist: true).where.not(salon_location: [nil, ''])
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end 
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :is_stylist)  
  end 
  
  def user_params_update
    params.require(:user).permit(:username, :email, :password, :salon_name, :salon_location, :appointment_number, :first_name, :last_name, :avatar, menus_attributes:[:menu, :user_id] )
  end 
  

  def set_user
     @user = User.friendly.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user && !current_user.admin? 
      flash[:danger] = "You can only edit or view your own account"
      redirect_to user_path(current_user)
    end 
  end 
  
  def require_admin
    if !current_user.admin? 
      flash[:danger] = "Sorry, you entered an invalid URL"
      redirect_to user_path(current_user)
    end 
  end 
end 


class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :require_user, only: [:edit, :update, :show, :add_to_wishlist ]
  before_action :require_same_user, only: [:edit, :update, :show]
  
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
  end 
  
  def index
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
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :is_stylist)  
  end 
  
  def user_params_update
    params.require(:user).permit(:username, :email, :password, :salon_name, :salon_location, :appointment_number, :first_name, :last_name, :avatar, menus_attributes:[:menu, :user_id] )
  end 
  

  def set_user
     @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit or view your own account"
      redirect_to user_path(current_user)
    end 
  end 
  
end 


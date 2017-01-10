class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_user, only: [:edit, :update ]
  before_action :require_same_user, only: [:edit, :update]
  
  def new 
    @user = User.new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id]=@user.id
      flash[:success] = "Welcome to Crownshot"
      redirect_to user_path(@user)
    else
      render "new"
    end 
  end 
  
  def edit 
    @menu = Menu.new  end 
  
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
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :password)  
  end 
  
  def user_params_update
    params.require(:user).permit(:username, :email, :password, :salon_name, :salon_location, :appointment_number, :first_name, :last_name, :avatar, menus_attributes:[:menu, :user_id] )
  end 
  

  def set_user
    
     @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to user_path(current_user)
    end 
  end 
  
end 


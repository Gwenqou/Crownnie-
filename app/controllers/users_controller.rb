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

  end 
  
  def update 
    respond_to do |format|
      if @user.update(user_params_update)
        if params[:menus]
          params[:menus].each do |menu|
            @user.menus.create(menu: menu[:menu])
          end 
        end 
        format.html{
          flash[:success] = 'Your profile was updated successfully'
          redirect_to edit_user_path(@user)
        }
        format.json {render :edit, status: :ok, location: @user }
      else
        format.html {render 'edit'}
        format.json {render json: @user.errors, status: :unprocessable_entity }
      end 
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


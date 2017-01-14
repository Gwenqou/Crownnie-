class PasswordResetsController < ApplicationController 
  
  def new 
    
  end 
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url
    flash[:success] = "Email sent with password reset instruction"
  end 
  
  def edit 
    @user = User.find_by_password_reset_token!(params[:id])
  end 
  
  def update 
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif !params[:user][:password].present?
      render 'edit'
      flash[:danger] = "The password field can't be empty"
    elsif @user.update_attributes(params.permit![:user])
      redirect_to root_url
      flash[:success] = "Password has been reset!"
    else 
      render 'edit'
    end 
  end 
end 
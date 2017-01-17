class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :is_stylist?, :is_admin?
  
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token] && cookies[:auth_token].length > 0
  end 
  
  def logged_in?
    !!current_user
  end 
  
  def is_stylist?
    current_user.is_stylist !=  false
  end 
  
  def is_admin?
    current_user.admin !=  false
  end 
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end 
  end 
  
  def require_is_stylist
    if current_user.is_stylist != true
      flash[:danger] = "You must be a stylist to perform that action"
      redirect_to root_path
    end 
  end 
  

end

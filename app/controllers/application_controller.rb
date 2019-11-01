class ApplicationController < ActionController::Base

  def logged_in? 
    !!current_user 
  end 

  def current_user 
    @current_user ||= User.find(session[:user_id])
  end

  def admin? 
    current_user.admin 
  end 

end

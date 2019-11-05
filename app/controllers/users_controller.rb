class UsersController < ApplicationController 

  def new 
    if !logged_in?
      @user = User.new
    else 
      user_path(current_user) 
    end  
  end 

  def create 
    user = User.create(user_params)

    if user.valid? 
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else 
      redirect_to new_user_path 
    end   
  end

  def show 
    if logged_in?
      @user = User.find_by(:id => params[:id])
    else 
      root_path
    end 
  end 
  
  
  private 

  def user_params 
    params.require(:user).permit(:first_name,:email,:password,:admin)
  end 
end 
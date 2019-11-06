class UsersController < ApplicationController 

  def new 
    @user = User.new
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
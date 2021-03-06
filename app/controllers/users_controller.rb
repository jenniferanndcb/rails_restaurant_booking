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
    @user = User.find_by(:id => params[:id])
    @restaurants = @user.owned_restaurants(@user)
  end 

  def edit 
    @user = User.find_by(:id => params[:id])
  end 

  def update 
    @user = User.find_by(:id => params[:id])
    @user.update(user_params)
    @user.save 
  end 
  
  
  private 

  def user_params 
    params.require(:user).permit(:first_name,:email,:password,:admin)
  end 
end 
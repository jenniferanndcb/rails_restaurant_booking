class SessionsController < ApplicationController 

  def new  
    @new = User.new 
  end 

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Invalid log in details."
      redirect_to signin_path 
    end 
  end 

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end 
end 
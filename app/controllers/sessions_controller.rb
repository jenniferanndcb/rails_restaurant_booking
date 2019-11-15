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
  
  def create_from_fb 
    @user = User.fb_create(auth)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to "/"
    else 
      render "/signin"
    end 
  end 

  def auth 
    request.env['omniauth.auth']
  end 

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end 
end 
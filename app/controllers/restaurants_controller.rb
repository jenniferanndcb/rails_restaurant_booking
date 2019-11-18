class RestaurantsController < ApplicationController 
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


  def new
    @restaurant = Restaurant.new  
  end 
  
  def create 
    restaurant = current_user.restaurants.build(rest_params_user)
     
    if restaurant.valid?

      redirect_to restaurant_path(@restaurant)
    else 
      redirect_to new_restaurant_path 
    end 
   
  end 

  def index
    city = params[:city] 
    @restaurants = Restaurant.where(city: city)
  end 

  #

  def show 
    # @restaurant = Restaurant.find_by(id: params[:id])
  end 

  def edit 
    # @restaurant = Restaurant.find_by(id: params[:id])
  end 

  def update 
    # @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else 
      redirect_to edit_restaurant_path(@restaurant)
    end 
  end 

  def destroy 
    @restaurant.delete
  end 

  private 
  
  def set_restaurant 
    @restaurant = Restaurant.find_by(id: params[:id])
  end 

  def restaurant_params 
    params.require(:restaurant).permit(:name,:city,:website,:phone_number,:capacity)
  end 

  def rest_params_user 
    r_params = restaurant_params 
    r_params[:user_id] = current_user.id 
    r_params
  end 
  
end 
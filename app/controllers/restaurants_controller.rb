class RestaurantsController < ApplicationController 
  before_action :set_restaurant, only: [:show, :edit, :update]

  def new
    @restaurant = Restaurant.new  
  end 
  
  def create 
    restaurant = Restaurant.create(restaurant_params)
    if restaurant.valid? 
      redirect_to restaurant_path(restaurant)
    else 
      redirect_to new_restaurant_path 
    end 
  end 

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

  private 
  
  def set_restaurant 
    @restaurant = Restaurant.find_by(id: params[:id])
  end 

  def restaurant_params 
    params.require(:restaurant).permit(:name,:location,:website,:phone_number,:opening_hrs)
  end 
end 
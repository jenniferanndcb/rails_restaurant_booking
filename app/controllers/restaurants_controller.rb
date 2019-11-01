class RestaurantsController < ApplicationController 

  def new
    @restaurant = Restaurant.new  
  end 
  
  def create 

  end 

  def show 
    @restaurant = Restaurant.find_by(id: params[:id])
  end 
end 
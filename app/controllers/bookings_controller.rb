class BookingsController < ApplicationController 

  def new 
    @booking = current_user.bookings.build(restaurant_id: params[:restaurant_id]) 
    
  end 

  def create 

  end 
end 
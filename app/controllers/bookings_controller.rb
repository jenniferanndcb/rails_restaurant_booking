class BookingsController < ApplicationController 

  def new 
    @booking = current_user.bookings.build(restaurant_id: params[:restaurant_id]) 
    
  end 

  def create 
    booking = current_user.bookings.build(restaurant_id: params[:restaurant_id])
    booking.confirm_booking 
    redirect_to user_path(current_user)
  end 
end 
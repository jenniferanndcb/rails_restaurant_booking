class BookingsController < ApplicationController 

  before_action :set_booking, only: [:edit, :update, :destroy]

  def new
    if !logged_in? 
      flash[:notice] = "You must be signed in to book a table."
      redirect_to '/signin'
    else 
      @booking = current_user.bookings.build(:restaurant_id => params[:restaurant_id]) 
    end 
  end 

  def create
    booking = current_user.bookings.build(booking_params_rest)

    if booking.enough_seats?(params[:booking][:booking_size].to_i)
      booking.save 
      flash[:notice] = "Your table has been booked. See you on #{booking.booking_date.strftime("%A %e of %B")}."
      redirect_to user_path(current_user)
    else  
      flash[:error] = "Sorry. We do not have any tables for this time. Try to book for a different date or time." 
      redirect_to new_restaurant_booking_path(booking.restaurant)
    end 
  end 

  def edit
    # @booking = Booking.find_by(id: params[:id])
  end 

  def update 
    # @booking = Booking.find_by(id: params[:id])
    if @booking.update(booking_params)
      flash[:notice] = "Your booking has been updated."
      redirect_to user_path(current_user)
    else 
      redirect_to edit_booking_path(@booking)
    end 
  end 
  
  def destroy 
    # @booking = Booking.find_by(id: params[:id])
    @booking.destroy 
    flash[:notice] = "Your booking has been cancelled."
    redirect_to user_path(current_user)
  end 

  private 

  def set_booking
    @booking = Booking.find_by(id: params[:id])
  end 

  def booking_params 
    params.require(:booking).permit(:booking_date, :booking_time, :booking_size)
  end

  def booking_params_rest
    b_params = booking_params
    b_params["restaurant_id"] = params[:restaurant_id]
    b_params
  end 
end 

# {
#   "authenticity_token" => 
#     "Rs617/ZZxFZxkFl8eubjhY9kW6GbWFsy+Xfi5aa2iPd04wiSqEEwgjYMxQMXgGUJnkgKNn6B5VyVTPGKBEL9dw==", 
#   "booking" => 
#     <ActionController::Parameters {
#       "booking_date"=>"2019-11-23", 
#       "booking_time"=>"14:29", 
#       "booking_size"=>"3"
#     } permitted: false>, 
#   "commit"=>"Book a Table", 
#   "controller"=>"bookings", 
#   "action"=>"create", 
#   "restaurant_id"=>"3"
# }
  
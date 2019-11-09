class BookingsController < ApplicationController 

  def new
    @booking = current_user.bookings.build(:restaurant_id => params[:restaurant_id]) 
    
  end 

  def create
    booking = current_user.bookings.build(booking_params_rest)

    if booking.enough_seats?(params[:booking][:booking_size].to_i)
      booking.save 
      flash[:notice] = "Your table has been booked. See you on #{booking.booking_date}."
      redirect_to user_path(current_user)
    else  
      flash[:error] = "Sorry. We do not have any tables for this time. Try to book for a different date or time." 
      redirect_to new_restaurant_booking_path(booking.restaurant)
    end 

  end 

  private 

  # def bookings_params
  #   params.require(:booking).permit(:booking_date, :booking_time, :booking_size, restaurant_attributes: [:restaurant_id])
  # end

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
  
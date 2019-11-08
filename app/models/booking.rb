class Booking < ApplicationRecord 
  belongs_to :user
  belongs_to :restaurant

  def confirm_booking 
    if !enough_seats? 
      "Sorry. We do not have any tables for this time. Try to book for a different date or time."
    else 
      self.restaurant.capacity = self.restaurant.capacity - self.booking_size(params[:booking_size]) 
      "Your table has been booked. See you on #{self.booking_date}."
    end  
  end 


  private 

  def enough_seats?
    binding.pry
    self.restaurant.capacity > self.booking_size(params[:booking_size]) 
  end 

end 
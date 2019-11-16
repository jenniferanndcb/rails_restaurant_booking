class Booking < ApplicationRecord 
  validates :booking_date, presence: :true 
  
  belongs_to :user
  belongs_to :restaurant

  def enough_seats?(booking_size)
    self.restaurant.capacity > booking_size.to_i
  end 


  
  # when trying to book, take the restaurant capacity and 
  # minus from that the total number of guests
  # who have bookings at that time.
  # if booking_size is less than or equal to the remainder
  # let the booking be made
  # if not, say, not valid, not enough available seats.

end 
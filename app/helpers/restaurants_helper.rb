module RestaurantsHelper 

  def restaurant_action_link(restaurant)
    if current_user.admin 
      link_to "Edit Restaurant", edit_restaurant_path(restaurant)
      # link_to "See all your restaurants", 
    else  
      @booking = Booking.new(user_id: current_user.id, restaurant_id: restaurant.id)
      link_to "Book a table", new_restaurant_booking_path(restaurant)
    end 
  end 

end 
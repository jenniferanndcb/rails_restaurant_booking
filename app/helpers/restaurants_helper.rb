module RestaurantsHelper 

  def restaurant_action_link(restaurant)
    if logged_in?
      if current_user.admin && restaurant.user_id == current_user.id 
          link_to "Edit Restaurant", edit_restaurant_path(restaurant) 
      else  
        @booking = Booking.new(user_id: current_user.id, restaurant_id: restaurant.id)
        link_to "Book a table", new_restaurant_booking_path(restaurant)
      end 
    else 
      link_to "Book a table", new_restaurant_booking_path(restaurant)  
    end 
  end 


end 
class Bookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t| 
      t.integer :user_id
      t.integer :restaurant_id 
      t.date :booking_date
      t.time :booking_time 
      t.integer :booking_size 

      t.timestamps
    end 
  end
end

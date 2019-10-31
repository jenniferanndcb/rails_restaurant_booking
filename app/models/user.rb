class User < ApplicationRecord 
  has_many :bookings 
  has_many :restaurants, through: :bookings 

  has_secure_password 

end 
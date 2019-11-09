class Restaurant < ApplicationRecord 
  has_many :bookings 
  has_many :users, through: :bookings 
  
  accepts_nested_attributes_for :bookings
end 
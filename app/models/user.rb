class User < ApplicationRecord 
  has_secure_password
  validates :email, :password, presence: :true
  validates :email, uniqueness: :true 
    
  has_many :bookings 
  has_many :restaurants, through: :bookings 

   

end 
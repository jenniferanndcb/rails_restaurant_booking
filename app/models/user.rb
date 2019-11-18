class User < ApplicationRecord 
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true 
    
  has_many :bookings 
  has_many :restaurants
  has_many :restaurants, through: :bookings 

  def self.fb_create(auth)
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |u| 
      u.first_name = auth["info"]["name"] 
      u.password = SecureRandom.hex(32)
    end 
  end 

  def owned_restaurants(user) 
  
    @restaurants = Restaurant.select(:id, :name).where("user_id = #{self.id}")
  
  end 
  
    # where(user.id == user_id) 
     
     
 

end 
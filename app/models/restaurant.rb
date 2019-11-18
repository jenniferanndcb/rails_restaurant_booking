class Restaurant < ApplicationRecord 
  has_many :bookings 
  has_many :users, through: :bookings 
  belongs_to :user, -> {where admin: true }

  validates :name, presence: true 
  
  accepts_nested_attributes_for :bookings

end 
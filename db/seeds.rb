# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


# 5.times do 
#   Restaurant.create(
#     name: Faker::Restaurant.name,
#     city: Faker::Address.city,
#     phone_number: Faker::PhoneNumber.phone_number
#   )
# end 

restaurant_list = [
  ["The Wolsely", "London", "https://www.thewolseley.com", 20],
  ["Hoppers", "London", "https://www.hopperslondon.com", 30], 
  ["Alston Bar & Beef", "Manchester", "https://alstonmanchester.co.uk", 30],
  ["Mana", "Manchester", "https://manarestaurant.co.uk", 15],
  ["Adam's Restaurant", "Birmingham", "https://www.adamsrestaurant.co.uk", 50], 
  ["The Gingerman", "Brighton", "gingermanrestaurant.com", 30]
]

restaurant_list.each do |name, city, website, capacity| 
  Restaurant.create(name: name, city: city, website: website, capacity: capacity)
end 
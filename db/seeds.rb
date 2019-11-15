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
  ["The Wolsely", "London"],
  ["Hoppers", "London"], 
  ["Alston Bar & Beef", "Manchester"],
  ["Mana", "Manchester"],
  ["Adam's Restaurant", "Birmingham"], 
  ["The Gingerman", "Brighton"]
]

restaurant_list.each do |name, city| 
  Restaurant.create(name: name, city: city)
end 
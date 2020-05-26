# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Buyer.destroy_all
Item.destroy_all
Seller.destroy_all
BuyersCart.destroy_all
SellersCart.destroy_all

hoursofop = ["9-5","10-7", "12-9"]
zipcodes = [12345,43212,07304,11237,67059,45948]
images = ["https://i.pinimg.com/originals/ca/f0/d5/caf0d584aa5ac3c706afc3b709303892.jpg","https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-320-80.jpg","https://riviste.newbusinessmedia.it/wp-content/uploads/sites/27/2013/12/Fotolia_11313277_M.jpg", "https://www.mr-fruity.co.uk/wp-content/uploads/2019/04/water-melon.jpg","https://s3.amazonaws.com/cdn.gurneys.com/images/grapes-new.jpg"]



20.times do
Buyer.create(name:Faker::Name.name, phone:Faker::PhoneNumber.cell_phone, zip:zipcodes.sample,email: Faker::Name.first_name + "@gmail.com")
Item.create(name:Faker::Food.fruits,price: rand(1..10), description:Faker::Food.description, photo: images.sample )
Seller.create(name:Faker::Name.name, phone:Faker::PhoneNumber.cell_phone, zip:zipcodes.sample,email: Faker::Name.first_name + "@gmail.com", photo:images.sample, bio:Faker::Coffee.notes, hours: hoursofop.sample)
end
puts "seeded bis"



10.times do
BuyersCart.create(buyer_id:Buyer.all.sample.id, item_id: Item.all.sample.id)
SellersCart.create(seller_id:Seller.all.sample.id, item_id: Item.all.sample.id )
end

puts "seeded joins"
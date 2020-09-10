# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create!(email: 'bob@example.com', password: 'qwerty')

Car.create!(model: "Jeep", price: "200$", capacity: "6", user: u)
Car.create!(model: "Kia", price: "200$", capacity: "8", user: u)
Car.create!(model: "Dodge", price: "200$", capacity: "5", user: u)
Car.create!(model: "Acura", price: "200$", capacity: "5", user: u)
Car.create!(model: "Mercedes Benz", price: "200$", capacity: "3", user: u)
Car.create!(model: "BMW", price: "200$", capacity: "4", user: u)



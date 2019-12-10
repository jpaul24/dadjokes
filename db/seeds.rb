# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Joke.destroy_all

puts "creating users"
luke = User.create!(email: 'luke@gmail.com', password:'mypassword', username: 'ldawg')
puts "users created"

puts "creating jokes"
joke1 = Joke.create!(user: luke, joke: 'Man walks into a bar, ouch')
puts "jokes created"

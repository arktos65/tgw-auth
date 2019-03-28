# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! :email => 'user@tgwconsulting.co',
             :password => 'password123',
             :password_confirmation => 'password123'
Admin.create! :email => 'admin@tgwconsulting.co',
              :password => 'password123',
              :password_confirmation => 'password123'

# app = Doorkeeper::Application.create! :name => "Barrique API",
#                                       :redirect_uri => "https://localhost:3000/callback"
#
# puts "Application: "
# puts "name: #{app.name}"
# puts "redirect_uri: #{app.redirect_uri}"
# puts "uid: #{app.uid}"
# puts "secret: #{app.secret}"
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# app = Doorkeeper::Application.create! :name => "Barrique API",
#                                       :redirect_uri => "https://localhost:3000/callback"
#
# puts "Application: "
# puts "name: #{app.name}"
# puts "redirect_uri: #{app.redirect_uri}"
# puts "uid: #{app.uid}"
# puts "secret: #{app.secret}"
#
puts '\nTask seed:'

puts '\n * [  ] User (seed)'
user = User.find_by(id: 1)
user = User.create!(
  id: 1,
  email: 'user@tgwconsulting.co',
  password: 'password123',
  password_confirmation: 'password123'
) if user.nil?
puts ' * [OK] User (seed)'

puts '\n * [  ] Admin (seed)'
admin = Admin.find_by(id: 1)
admin = Admin.create!(
  id: 1,
  email: 'admin@tgwconsulting.co',
  password: 'password123',
  password_confirmation: 'password123'
) if admin.nil?
puts ' * [OK] Admin (seed)'

# puts "\n * [  ] OAuth applications (seed)"
# oauthapp = Doorkeeper::Application.find_by(id: 1)
# oauthapp = Doorkeeper::Application.create!(
#   id: 1,
#   name: "Barrique API Development",
#   secret: "c2a76d9cfe8ad2743c040afe477067f1c2628638624f77cc81c0f5dbfcf5c9f0",
#   redirect_uri: "http://localhost:3000/users/auth/webgoal/callback",
#   scopes: "",
#   confidential: 1
# ) if oauthapp.nil?
# puts " * [OK] OAuth applications (seed)"
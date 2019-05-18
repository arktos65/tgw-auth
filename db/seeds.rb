# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# app = Doorkeeper::Application.create! :name => "Barrique API",
#                                       :redirect_uri => "https://localhost:3000/callback"
#
# puts "Application: "
# puts "name: #{app.name}"
# puts "redirect_uri: #{app.redirect_uri}"
# puts "uid: #{app.uid}"
# puts "secret: #{app.secret}"
#
puts "Task seed:"

puts " * [  ] User (seed)"
user = User.find_by(id: 1)
user = User.create!(
  id: 1,
  email: "user@tgwconsulting.co",
  password: "password123",
  password_confirmation: "password123"
) if user.nil?
puts " * [OK] User (seed)"

puts " * [  ] Admin (seed)"
admin = Admin.find_by(id: 1)
admin = Admin.create!(
  id: 1,
  email: "admin@tgwconsulting.co",
  password: "password123",
  password_confirmation: "password123"
) if admin.nil?
puts " * [OK] Admin (seed)"

puts " * [  ] OAuth applications (seed)"
puts " * [OK] OAuth applications (seed)"

app = Doorkeeper::Application.create!(
  name: "Barrique API Development",
  redirect_uri: "http://localhost:3000/users/auth/webgoal/callback"
)

puts ""
puts "***********************************"
puts "Application: "
puts "name: #{app.name}"
puts "redirect_uri: #{app.redirect_uri}"
puts "uid: #{app.uid}"
puts "secret: #{app.secret}"
puts "***********************************"

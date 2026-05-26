# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Nettoyage de la base de données
puts "Nettoyage de la base..."
Attendance.destroy_all
Event.destroy_all
User.destroy_all

# Création de 10 utilisateurs
puts "Création des utilisateurs..."
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    email: "#{Faker::Name.first_name.downcase}@yopmail.com" # Utilisation de yopmail pour les tests mailer
  )
end
users = User.all

# Création de 5 événements
puts "Création des événements..."
5.times do
  Event.create!(
    start_date: Faker::Time.forward(days: 30,  period: :evening), # Date dans le futur
    duration: [30, 45, 60, 90, 120].sample, # Multiple de 5
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph_by_chars(number: 300), # Entre 20 et 1000 chars
    price: rand(1..1000), # Entre 1 et 1000
    location: Faker::Address.city,
    administrator: users.sample # Association avec un User
  )
end
events = Event.all

# Création de participations (Attendances)
puts "Création des participations..."
15.times do
  Attendance.create!(
    user: users.sample,
    event: events.sample,
    stripe_customer_id: Faker::Alphanumeric.alphanumeric(number: 10)
  )
end

puts "Seed terminé : 10 users, 5 events et 15 participations créés !"

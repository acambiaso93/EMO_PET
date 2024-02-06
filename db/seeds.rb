# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

def random_animal_data
  animals = [
    { name: 'Buddy', breed: 'Dog', description: 'Friendly and playful' },
    { name: 'Luna', breed: 'Cat', description: 'Elegant and mysterious' },
    { name: 'Charlie', breed: 'Rabbit', description: 'Cute and fluffy' },
    { name: 'Milo', breed: 'Parrot', description: 'Colorful and talkative' },
    { name: 'Max', breed: 'Hamster', description: 'Tiny and adorable' },
    { name: 'Oliver', breed: 'Guinea Pig', description: 'Sweet and sociable' },
    { name: 'Leo', breed: 'Snake', description: 'Sleek and fascinating' },
    { name: 'Coco', breed: 'Fish', description: 'Graceful and vibrant' },
    { name: 'Lucy', breed: 'Turtle', description: 'Slow and wise' },
    { name: 'Rocky', breed: 'Ferret', description: 'Playful and inquisitive' },
    { name: 'Daisy', breed: 'Hedgehog', description: 'Adorable and spiky' },
    { name: 'Bella', breed: 'Iguana', description: 'Unique and exotic' },
    { name: 'Sadie', breed: 'Lizard', description: 'Colorful and agile' },
    { name: 'Tiger', breed: 'Tarantula', description: 'Fascinating and hairy' },
    { name: 'Oscar', breed: 'Goldfish', description: 'Shiny and graceful' },
    { name: 'Zoe', breed: 'Gecko', description: 'Small and curious' },
    { name: 'Sophie', breed: 'Betta Fish', description: 'Colorful and vibrant' },
    { name: 'Mia', breed: 'Gerbil', description: 'Active and social' },
    { name: 'Chloe', breed: 'Chinchilla', description: 'Soft and cuddly' },
  ]

  animals.sample
end

30.times do
  animal_data = random_animal_data
  Pet.create!(
    name: animal_data[:name],
    breed: animal_data[:breed],
    description: animal_data[:description]
  )
end

puts 'Seeding complete!'

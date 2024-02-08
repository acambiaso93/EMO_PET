# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Pet.destroy_all

animals_data = [
  { name: 'Buddy', breed: 'Dog', description: 'Buddy is a friendly and playful Golden Retriever. He loves going for long walks in the park and playing fetch with his favorite tennis ball.' },
  { name: 'Luna', breed: 'Cat', description: 'Luna is an elegant and mysterious Persian Cat. She enjoys lounging in sunbeams and observing the world from her lofty perch.' },
  { name: 'Charlie', breed: 'Rabbit', description: 'Charlie is a cute and fluffy Holland Lop Rabbit. He adores munching on fresh greens and hopping around in his spacious enclosure.' },
  { name: 'Milo', breed: 'Parrot', description: 'Milo is a colorful and talkative Macaw Parrot. He loves showing off his impressive vocabulary and singing along to his favorite tunes.' },
  { name: 'Max', breed: 'Hamster', description: 'Max is a tiny and adorable Syrian Hamster. He enjoys running on his wheel and snacking on sunflower seeds in his cozy cage.' },
  { name: 'Leo', breed: 'Snake', description: 'Leo is a sleek and fascinating Ball Python Snake. He enjoys basking under his heat lamp and exploring his terrarium during the evening.' },
  { name: 'Coco', breed: 'Fish', description: 'Coco is a graceful and vibrant Betta Fish. She glides through the water with elegance and adds a splash of color to any aquarium.' },
  { name: 'Lucy', breed: 'Turtle', description: 'Lucy is a slow and wise Red-Eared Slider Turtle. She enjoys swimming in her tank and basking on her sunning platform under her UV lamp.' },
  { name: 'Rocky', breed: 'Ferret', description: 'Rocky is a playful and inquisitive Ferret. He loves tunneling through his bedding and engaging in energetic games of chase with his human companions.' },
  { name: 'Daisy', breed: 'Hedgehog', description: 'Daisy is an adorable and spiky African Pygmy Hedgehog. She enjoys burrowing in her cozy nest of blankets and snuggling up for nap time.' },
  { name: 'Bella', breed: 'Iguana', description: 'Bella is a unique and exotic Green Iguana. She enjoys basking under her heat lamp and exploring her large enclosure filled with branches and foliage.' },
  { name: 'Sadie', breed: 'Lizard', description: 'Sadie is a colorful and agile Leopard Gecko. She enjoys hunting for crickets in her terrarium and lounging on her warm hide during the day.' },
  { name: 'Tiger', breed: 'Tarantula', description: "Tiger is a fascinating and hairy Chilean Rose Tarantula. He may look intimidating, but he's actually quite docile and enjoys lounging in his burrow." },
  { name: 'Oscar', breed: 'Goldfish', description: "Oscar is a shiny and graceful Common Goldfish. He glides elegantly through the water and adds a touch of tranquility to any aquarium with his vibrant colors." },
  { name: 'Zoe', breed: 'Gecko', description: 'Zoe is a small and curious Crested Gecko. She enjoys climbing on her branches and licking up fruit puree from her feeding dish with her sticky tongue.' },
  { name: 'Mia', breed: 'Gerbil', description: 'Mia is an active and social Mongolian Gerbil. She loves burrowing in her bedding and running on her exercise wheel, and she enjoys the company of her gerbil friends.' },
  { name: 'Chloe', breed: 'Chinchilla', description: 'Chloe is a soft and cuddly Standard Gray Chinchilla. She enjoys rolling around in her dust bath and snuggling up in her cozy fleece hammock for naps.' },
]

animals_data.each do |animal_data|
  breed = animal_data[:breed].downcase
  image_url = "https://loremflickr.com/300/200/#{breed}"
  Pet.create!(
    name: animal_data[:name],
    breed: animal_data[:breed],
    description: animal_data[:description],
    image_url: image_url
  )
end


puts 'Seeding complete!'

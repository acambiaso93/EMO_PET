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
User.destroy_all
Booking.destroy_all

puts 'Creating pets...'

animals_data = [
  { name: 'Buddy', breed: 'Dog', description: 'Buddy is a friendly and playful Golden Retriever. He loves going for long walks in the park and playing fetch with his favorite tennis ball.', image_url: "https://www.southernliving.com/thmb/9E2guP65DZP_ZnUP13pcVG8Sfmc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1285438779-2000-9ea25aa777df42e6a046b10d52b286b7.jpg" },
  { name: 'Luna', breed: 'Cat', description: 'Luna is an elegant and mysterious Persian Cat. She enjoys lounging in sunbeams and observing the world from her lofty perch.', image_url: "https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_square.jpg"},
  { name: 'Charlie', breed: 'Rabbit', description: 'Charlie is a cute and fluffy Holland Lop Rabbit. He adores munching on fresh greens and hopping around in his spacious enclosure.', image_url: "https://storage.googleapis.com/pod_public/1300/169106.jpg" },
  { name: 'Milo', breed: 'Parrot', description: 'Milo is a colorful and talkative Macaw Parrot. He loves showing off his impressive vocabulary and singing along to his favorite tunes.', image_url: "https://gardenandgun.com/wp-content/uploads/2023/03/parrot.jpg" },
  { name: 'Max', breed: 'Hamster', description: 'Max is a tiny and adorable Syrian Hamster. He enjoys running on his wheel and snacking on sunflower seeds in his cozy cage.', image_url: "https://cdn.britannica.com/57/192357-050-62E912BD/hamster-Syria-households-pet.jpg" },
  { name: 'Leo', breed: 'Snake', description: 'Leo is a sleek and fascinating Ball Python Snake. He enjoys basking under his heat lamp and exploring his terrarium during the evening.', image_url: "https://assets.iflscience.com/assets/articleNo/66639/aImg/64154/snake-clitoris-o.webp" },
  { name: 'Lucy', breed: 'Turtle', description: 'Lucy is a slow and wise Red-Eared Slider Turtle. She enjoys swimming in her tank and basking on her sunning platform under her UV lamp.', image_url: "https://www.treehugger.com/thmb/ssH-GmqJrN1qxe8-9T0N678gzNs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/3-d88b05d20a1f430ab652b96d933469b4.jpg" },
  { name: 'Rocky', breed: 'Ferret', description: 'Rocky is a playful and inquisitive Ferret. He loves tunneling through his bedding and engaging in energetic games of chase with his human companions.', image_url: "https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk3MDkzMDk4NTcwOTE3MTgz/are-ferrets-hypoallergenic.jpg"  },
  { name: 'Daisy', breed: 'Hedgehog', description: 'Daisy is an adorable and spiky African Pygmy Hedgehog. She enjoys burrowing in her cozy nest of blankets and snuggling up for nap time.', image_url: "https://i.natgeofe.com/n/e0096331-9ec6-4f34-9449-89d3fb77bc18/hedgehog_thumb.jpg"  },
  { name: 'Bella', breed: 'Iguana', description: 'Bella is a unique and exotic Green Iguana. She enjoys basking under her heat lamp and exploring her large enclosure filled with branches and foliage.', image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Iguana_iguana_Portoviejo_04.jpg/800px-Iguana_iguana_Portoviejo_04.jpg"  },
  { name: 'Sadie', breed: 'Lizard', description: 'Sadie is a colorful and agile Leopard Gecko. She enjoys hunting for crickets in her terrarium and lounging on her warm hide during the day.', image_url: "https://animals.sandiegozoo.org/sites/default/files/2017-07/animals-lizard-redheadedrockagama.jpg"  },
  { name: 'Tiger', breed: 'Tarantula', description: "Tiger is a fascinating and hairy Chilean Rose Tarantula. He may look intimidating, but he's actually quite docile and enjoys lounging in his burrow.", image_url: "https://c02.purpledshub.com/uploads/sites/62/2023/11/tarantula-.jpg"  },
  { name: 'Oscar', breed: 'Goldfish', description: "Oscar is a shiny and graceful Common Goldfish. He glides elegantly through the water and adds a touch of tranquility to any aquarium with his vibrant colors.", image_url: "https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTc0NDQ4NjE1Nzk1MDA4ODcy/goldfish-interesting-and-surprising-facts-about-a-popular-pet.jpg"  },
  { name: 'Zoe', breed: 'Gecko', description: 'Zoe is a small and curious Crested Gecko. She enjoys climbing on her branches and licking up fruit puree from her feeding dish with her sticky tongue.', image_url: "https://media.istockphoto.com/id/153516614/photo/crested-gecko-isolated-on-black.jpg?s=612x612&w=0&k=20&c=OrcZZ1uN5VEAUtLf7K9q2s0Tb0jKOOMAfJuxjQsn3zw="  },
  { name: 'Mia', breed: 'Gerbil', description: 'Mia is an active and social Mongolian Gerbil. She loves burrowing in her bedding and running on her exercise wheel, and she enjoys the company of her gerbil friends.', image_url: "https://rp-online.de/imgs/32/1/4/5/7/9/7/0/1/tok_8595163b87895c390dd7b89096b2c86f/w1000_h667_x500_y333_c805e51ad116008f.jpg"  },
  { name: 'Chloe', breed: 'Chinchilla', description: 'Chloe is a soft and cuddly Standard Gray Chinchilla. She enjoys rolling around in her dust bath and snuggling up in her cozy fleece hammock for naps.', image_url: "https://www.zooplus.de/magazin/wp-content/uploads/2017/03/chinchilla3-1-768x511.jpg"  },
]

animals_data.each do |animal_data|
  Pet.create!(
    name: animal_data[:name],
    breed: animal_data[:breed],
    description: animal_data[:description],
    image_url: animal_data[:image_url]
  )
end

puts 'Pets created successfully!'

puts 'Creating users...'

10.times do |n|
  User.create!(
    email: "user#{n+1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

puts 'Users created successfully!'

puts 'Creating bookings...'
10.times do |n|
  user = User.offset(rand(User.count)).first

  pet = Pet.offset(rand(Pet.count)).first

  start_date = Faker::Time.between_dates(from: Date.today, to: Date.today + 30, period: :day)
  end_date = start_date + rand(1..7).days

  Booking.create!(
    pet: pet,
    user: user,
    start_date: start_date,
    end_date: end_date
  )
end
puts 'Bookings created successfully!'

puts 'Seeding complete!'

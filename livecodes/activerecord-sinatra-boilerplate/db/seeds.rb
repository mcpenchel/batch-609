require 'faker'

# Place to kickstart the data in our database
# Remember, DO NOT run ruby db/seeds.rb
# Instead, execute rake db:seed
100.times do
  Restaurant.create!(
    name: "#{Faker::Kpop.boy_bands}'s #{Faker::Restaurant.name}",
    address: "#{Faker::Movies::StarWars.planet} Hangar",
    capacity: rand(10..2000)
  )
end
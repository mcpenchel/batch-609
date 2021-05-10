require 'faker'
# This is where you can create initial data for your app.
puts 'Creating restaurants...'

100.times do
  r = Restaurant.new(
    name: "#{Faker::TvShows::Buffy.character}'s #{Faker::Restaurant.name}",
    address: "#{Faker::TvShows::Buffy.episode} Street n#{rand(0..10_000)}",
    rating: rand(1..5)
  )
  r.save!
end

puts "Finished creating restaurants!"
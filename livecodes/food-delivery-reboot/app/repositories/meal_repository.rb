require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository

  def initialize(csv_file_path)
    super(csv_file_path, Meal)
  end

end

# repo = MealRepository.new("data/meals.csv")

# cassava_lasagna = Meal.new(
#   name: "Cassava Lasagna",
#   price: 25
# )

# repo.create(cassava_lasagna)

# repo.all.each do |meal|
#   puts "#{meal.id} - #{meal.name} - #{meal.price}"
# end

# puts repo.find(2).name
require 'csv'
require_relative '../models/meal'

class MealRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def create(meal)
    meal.id = @meals.empty? ? 1 : @meals.last.id + 1
    @meals << meal
    save_csv
  end

  private
  def save_csv
    csv_options = {
      col_sep: ",",
      quote_char: '"',
      force_quotes: true
    }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|  
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row will be something like this:
      # {
      #   id: "1"
      # }
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end
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
require 'csv'

class Cookbook

  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = [] # I'm an array of instances of Recipe
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe) # recipe is an instance of Recipe
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def save_csv
    #1. Open CSV in writing mode
    CSV.open(@csv_file, "wb") do |csv|
    #2. Iterate over our array of instances of recipe
      @recipes.each do |recipe|
    #3. Add each recipe name and recipe description to the csv
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_csv
    #1. Iterate over csv file with the right path
    CSV.foreach(@csv_file) do |row|
    #2. for each line, create a new instance of Recipe
    #3. and store it in your @recipes
      @recipes << Recipe.new(row[0], row[1])
    end
  end

end


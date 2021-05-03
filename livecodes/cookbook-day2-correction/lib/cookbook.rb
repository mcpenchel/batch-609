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

  def mark_as_done(index)
    @recipes[index].mark_as_done!
    save_csv
  end

  private

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    #1. Open CSV in writing mode
    CSV.open(@csv_file, "wb", csv_options) do |csv|
    #2. Iterate over our array of instances of recipe
      @recipes.each do |recipe|
    #3. Add each recipe name and recipe description to the csv
        csv << [
          recipe.name, recipe.description, recipe.rating, recipe.done?, recipe.prep_time
        ]
      end
    end
  end

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"' }

    #1. Iterate over csv file with the right path
    CSV.foreach(@csv_file, csv_options) do |row|
    #2. for each line, create a new instance of Recipe
    #3. and store it in your @recipes

      # So we format the data to their correct types
      # when we load from CSV!!
      done = row[3] == "true"

      @recipes << Recipe.new(
        name: row[0],
        description: row[1],
        rating: row[2].to_i,
        done: done,
        prep_time: row[4]
      )
    end
  end

end


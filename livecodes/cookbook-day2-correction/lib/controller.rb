require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_allrecipes_service'
require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

class Controller

  def initialize(cookbook) # cookbook is an instance of Cookbook class
    @view = View.new
    @cookbook = cookbook
  end

  def create
    #1. Ask user for information
    recipe_array = @view.ask_for_recipe_info
    #2. Create the instance of recipe
    recipe = Recipe.new(
      name: recipe_array[0],
      description: recipe_array[1],
      rating: recipe_array[2],
      prep_time: recipe_array[3]
    )
    #3. Store the info
    @cookbook.add_recipe(recipe)
  end

  def list
    #1. Get all the recipes from the repo
    recipes = @cookbook.all
    #2. Ask view to display it all
    @view.display(recipes)
  end

  def destroy
    #1. Ask which one to be destroyed
    index = @view.ask_for_input
    #2. Find the right recipe on repository (cookbook)
    #3. Ask the cookbook to destroy the recipe
    recipe = @cookbook.remove_recipe(index)
  end

  def import
    ingredient = @view.ask_for_ingredient

    scraper = ScrapeAllrecipesService.new(ingredient)
    recipes_array = scraper.call

    index = @view.display_imported_recipes(recipes_array)

    prep_time = scraper.fetch_prep_time(index)

    recipes_array[index][:prep_time] = prep_time

    recipe = Recipe.new(recipes_array[index])
    @cookbook.add_recipe(recipe)
  end

  def mark_as_done
    # 0) Print all the recipes and their indexes
    list
    # 1) Ask which recipe index to mark as done
    # 2) Get the answer back from the user
    index = @view.ask_which_recipe_to_mark_as_done
    # 3) Find the correct recipe in the repo
    # 4) Trigger the model method to mark it as done
    # 5) Cookbook should PERSIST the change
    @cookbook.mark_as_done(index)
  end

end

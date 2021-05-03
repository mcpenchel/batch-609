require_relative 'view'
require_relative 'recipe'

class Controller

  def initialize(cookbook) # cookbook is an instance of Cookbook class
    @view = View.new
    @cookbook = cookbook
  end

  def create
    #1. Ask user for information
    recipe_array = @view.ask_user_for_recipe_and_description
    #2. Create the instance of recipe
    recipe = Recipe.new(recipe_array[0], recipe_array[1])
    #3. Store the info
    @cookbook.add_recipe(recipe)
  end

  def list
    #1. Get all the recipes from the repo
    recipes = @cookbook.all
    #2. Ask view to display it all
    @view.displays(recipes)
  end

  def destroy
    #1. Ask which one to be destroyed
    index = @view.ask_for_input
    #2. Find the right recipe on repository (cookbook)
    #3. Ask the cookbook to destroy the recipe
    recipe = @cookbook.remove_recipe(index)
  end

end

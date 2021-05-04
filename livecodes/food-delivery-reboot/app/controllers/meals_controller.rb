require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # 1) Ask for meal name
    name = @view.ask_for("name")
    # 2) Ask for meal price
    price = @view.ask_for("price").to_i
    # 3) Instantiate a new Meal instance
    meal = Meal.new(name: name, price: price)
    # 4) Send it to the repo.create metho
    @meal_repository.create(meal)
  end

  def list
    # 1) Get the array @meals from the repo
    meals = @meal_repository.all
    # 2) Loop over the array
    # 3) And print each meal's id, name and price
    @view.list(meals)
  end

end
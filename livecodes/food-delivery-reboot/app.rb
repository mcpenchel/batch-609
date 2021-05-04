# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/models/customer'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'router'

customers_repo = CustomerRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customers_repo)

meals_repo = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meals_repo)

router = Router.new(meals_controller, customers_controller)
router.run

# meal = meals_repo.find(1)
# customer = customers_repo.find(1)

# Ruby
# Duck Typing
# If it QUACKS,
# I don't care if it's a duck!
# [meal, customer].each do |element|
#   element.to_csv
# end
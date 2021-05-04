# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'
require_relative 'router'

router = Router.new
router.run

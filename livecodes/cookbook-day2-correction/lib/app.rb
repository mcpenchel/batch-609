require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run



# list all recipes

# 1. create list all method in my controller
# 2. controller asks repository for all the recipes
# 3. controller sends all info to view
# 4. view displays everything

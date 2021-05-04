class Router

  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    while @running
      display_tasks
      user_option = gets.chomp.to_i
      route_to(user_option)
    end
  end

  def display_tasks
    puts "1 - List all meals"
    puts "2 - Create a meal"
    puts "3 - List all customers"
    puts "4 - Create a customer"
    puts "5 - Exit"
  end

  def route_to(user_option)
    case user_option
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @running = false
    else
      puts "Invalid option, please choose a valid one."
    end
  end

end
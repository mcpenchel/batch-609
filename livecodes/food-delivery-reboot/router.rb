class Router

  def initialize
    @running = true
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
    when 1 then puts "TO-DO: List all meals"
    when 2 then puts "TO-DO: Create a meal"
    when 3 then puts "TO-DO: List all customers"
    when 4 then puts "TO-DO: Create a customer"
    when 5 then @running = false
    else
      puts "Invalid option, please choose a valid one."
    end
  end

end
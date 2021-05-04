class CustomersView

  def list(array_of_customers)
    array_of_customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(customer_attribute)
    puts "What's the #{customer_attribute}?"
    gets.chomp
  end

end
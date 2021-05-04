class MealsView

  def list(array_of_meals)
    array_of_meals.each do |meal|
      puts "#{meal.id}. #{meal.name} - #{meal.price}"
    end
  end

  def ask_for(meal_attribute)
    puts "What's the #{meal_attribute}?"
    gets.chomp
  end

end
class View

  def ask_user_for_recipe_and_description
    puts "What recipe would you like to add?"
    print "> "
    recipe = gets.chomp
    puts "What is it's description?"
    print "> "
    description = gets.chomp
    return [recipe, description]
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}"
    end
  end

  def ask_for_input
    puts "What index would you like to delete?"
    print "> "
    gets.chomp.to_i - 1
  end

end

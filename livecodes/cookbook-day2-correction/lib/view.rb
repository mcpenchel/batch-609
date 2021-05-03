class View

  def ask_for_ingredient
    puts "What ingredient would you like a recipe for?"
    ingredient = gets.chomp

    puts "Looking for \"#{ingredient}\" recipes on the Internet..."

    ingredient
  end

  def display_imported_recipes(recipes_array)
    recipes_array.each_with_index do |recipe_hash, index|
      puts "#{index + 1}. #{recipe_hash[:name]}"
    end

    puts "Which recipe would you like to import? (enter index)"
    index = gets.chomp.to_i - 1

    puts "Importing \"#{recipes_array[index][:name]}\"..."

    index
  end

  def ask_for_recipe_info
    puts "What recipe would you like to add?"
    print "> "
    recipe = gets.chomp
    puts "What is it's description?"
    print "> "
    description = gets.chomp
    puts "What is it's rating?"
    print "> "
    rating = gets.chomp.to_i
    puts "What is it's preparation time?"
    print "> "
    prep_time = gets.chomp
    return [recipe, description, rating, prep_time]
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? "X" : " "

      puts "#{index + 1}. [#{done}] #{recipe.name} (rating #{recipe.rating} | prep time: #{recipe.prep_time})"
    end
  end

  def ask_for_input
    puts "What index would you like to delete?"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_which_recipe_to_mark_as_done
    puts "What's the recipe you want to mark as done? Provide the index"
    print "> "
    gets.chomp.to_i - 1
  end

end

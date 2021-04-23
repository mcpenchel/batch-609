# Data types Recap

"Matt"  # Strings
"Matt is #{30 + 1} years old" # Strings with double quotes for interpolation

31   # Integers
31.0 # Floats

true  # Boolean values
false

(1..10) # Ranges, which are really useful to be converted to arrays, like (1..10).to_a

array = []  # Array (we can execute the CRUD operations on it)
array << "New element"
array[0] = "Updated element"
array.delete_at(0)

nil # nil
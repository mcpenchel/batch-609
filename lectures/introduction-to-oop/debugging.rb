# require 'pry-byebug'

def full_name(first, last)
  first_name = first.capitalize
  # binding.pry # => we call this a breakpoint
  last_name  = last.capitalize

  "#{first_name} #{last_name}"
end

name = full_name("brann", "dailor")

# binding.pry # => we call this a breakpoint

puts name

# When in the debugging terminal, not in the code, you can type
# next or continue!

# next => skips to the next line

# continue => makes the code keep running,
# and goes until the end (or until it finds another
# breakpoint)
# singer.rb -> lower_snake_case
class Singer # -> UpperCamelCase
  # sacred method name, the initialize method gets executed when we do Singer.new
  def initialize(name, musical_style, age)
    @name = name
    @musical_style = musical_style
    @age = age

    @dead = false
  end

  # instance methods
  def description(extensive)
    if extensive
      "The singer #{@name}, which sings #{@musical_style}, is #{@age} years old."
    else
      "#{@name} sings #{@musical_style}"
    end
  end

  def sing
    case @musical_style
    when "Sertanejo"
      puts "Laralalala"
    when "Stoner Metal"
      puts "Alriiighht"
    else
      puts "Lurururu"
    end
  end

  def die!
    @dead = true
  end

  # >> Encapsulation <<
  # By default, all the data/state is protected from the outside world
  # It's not accessible from outside the class definition.
  #
  # When we create an attr_reader, we're EXPOSING the value to the outside world
  # which will have access to it.

  # ACADEMICALLY SPEAKING
  # An Attribute Reader, so, the Instance Method that returns an Instance Variable (so, an ATTRIBUTE)
  # Is actually called a Getter Method, 'cause it GETS the information

  # Implements the Getter Method for name
  attr_reader :name

  # just like
  # def name
  #   @name
  # end

  # Implements the Setter Method for name
  # attr_writer :name

  # just like
  # def name=(new_name)
  #   @name = new_name
  # end

  # Implements both Setter and Getter Methods for musical_style and age
  # It's just like attr_reader + attr_writer
  attr_accessor :musical_style, :age

  def dead?
    @dead
  end

end

gustavo = Singer.new("Gustavo Lima", "Sertanejo", 31)
brann   = Singer.new("Brann Dailor", "Stoner Metal", 46)

puts gustavo.musical_style
puts gustavo.name
puts gustavo.age
puts gustavo.dead?

gustavo.die!

puts gustavo.dead?

puts gustavo.description(true)
puts gustavo.description(false)

gustavo.musical_style = "Bossa Nova"

gustavo.age = 32

puts gustavo.musical_style
puts gustavo.age
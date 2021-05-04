class Meal

  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id    = attributes[:id]
    @name  = attributes[:name]
    @price = attributes[:price]
  end

end

# caponata = Meal.new(id: 1, name: "Eggplant Caponata", price: 20)
# puts "#{caponata.id} - #{caponata.name} - #{caponata.price}"
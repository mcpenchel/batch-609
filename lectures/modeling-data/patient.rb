class Patient

  attr_reader :name, :illness
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id      = attributes[:id]
    @name    = attributes[:name]
    @illness = attributes[:illness]
    @cured   = attributes[:cured] || false
    @room    = attributes[:room]
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end

end


# ozzy = Patient.new(
#   name: "Ozzy Osbourne",
#   illness: "Dementia"
# )

# puts ozzy.name
# puts ozzy.illness
# puts ozzy.cured?
# ozzy.cure!
# puts ozzy.cured?

# andre = Patient.new(
#   name: "Marcos André",
#   cured: true
# )

# puts andre.cured?

# eduardo = Patient.new
# puts eduardo.name
# puts eduardo.illness
# puts eduardo.cured?
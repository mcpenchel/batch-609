class Car

  # color, fuel_type, manufacturer
  def initialize(color, fuel_type, manufacturer)
    @color = color
    @fuel_type = fuel_type
    @manufacturer = manufacturer

    @engine_started = false
  end

  def start_engine
    # we can call methods from inside another method
    inject_fuel_into_motor
    send_energy_to_battery

    @engine_started = true
  end

  private

  # Private methods can only be called from within
  # the class!!

  def inject_fuel_into_motor
    # this would do complex stuff
    puts "Injecint fuel.... done"
  end

  def send_energy_to_battery
    # this would also do complex stuff
    puts "Sending energy..... done"
  end

end


fusca = Car.new("Fusca", "diesel", "Wolksvagen")

# fusca.send_energy_to_battery # => private method! Won't work!

fusca.start_engine
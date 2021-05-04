require_relative 'patient'

class Room

  attr_reader :patients, :door_number
  attr_accessor :id

  def initialize(attributes = {})
    @id             = attributes[:id]
    @door_number    = attributes[:door_number]

    @number_of_beds = attributes[:number_of_beds] || 0
    @patients       = attributes[:patients] || []
  end

  def full?
    @patients.size == @number_of_beds
  end

  def add_patient(patient)
    # self => is the room on which .add_patient was called
    if full?
      raise Exception
    else
      @patients << patient
      patient.room = self
    end
  end

end

rock_room = Room.new(
  door_number: "Rock 01",
  number_of_beds: 2
)

ozzy = Patient.new(
  name: "Ozzy Osbourne",
  illness: "Dementia"
)

andre = Patient.new(
  name: "Marcos André",
  cured: true
)

eduardo = Patient.new

rock_room.add_patient(ozzy)
rock_room.add_patient(andre)

# puts ozzy.room.door_number
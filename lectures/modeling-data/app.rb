require_relative 'patient'
require_relative 'room'
require_relative 'patient_repository'
require_relative 'room_repository'

room_repository = RoomRepository.new('rooms.csv')
patients_repo   = PatientRepository.new('patients.csv', room_repository)

patients_repo.all.each do |patient|
  puts "#{patient.id} - #{patient.name} - #{patient.room.door_number}"
end

pop_room = room_repository.find(2)

david = Patient.new(
  name: "David Pessanha",
  illness: "Headache"
)

pop_room.add_patient(david)

patients_repo.add_patient(david)


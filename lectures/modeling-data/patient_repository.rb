require 'csv'
require_relative 'patient'
require 'pry-byebug'

class PatientRepository

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository

    @patients = []
    load_csv
  end

  def all
    @patients
  end

  # Somewhere, in the PatientsController,
  # patient = Patient.new(...)
  # we'll have @patient_repository.add_patient(patient)

  # >> !!TODAY YOU'RE GONNA USE THIS!! <<
  def add_patient(patient)
    # @patients = []; id should be 1
    # @patients has 10 patients; id should be @patients.last.id + 1
    patient.id = @patients.empty? ? 1 : @patients.last.id + 1
    @patients << patient
    save_csv
  end

  private
  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      # Write the headers first
      csv << ["id","name","illness","cured","room_id"]

      @patients.each do |patient|
        # Respect the order of the headers
        csv << [
          patient.id, patient.name, patient.illness, patient.cured?, patient.room.id
        ]
      end
    end
  end

  def load_csv
    csv_options = {
      col_sep: ',',
      quote_char: '"',
      headers: :first_row, # it's only a hash because of this line
      header_converters: :symbol # the keys are symbols now, not strs
    }
    
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # 1st iteration
      # row[:id] # => "1"
      # row[:name] # => "Ozzy Osbourne"
      # row[:illness] => "dementia"
      # row[:cured] => "false"
      # row[:room_id] => "1"

      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      # Deserializing from room_id to an actual room instance
      row[:room] = @room_repository.find(row[:room_id].to_i)

      @patients << Patient.new(row)
    end
  end

end
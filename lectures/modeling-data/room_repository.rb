require 'csv'
require_relative 'room'
require 'pry-byebug'

class RoomRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def add_room(room)
    room.id = @rooms.empty? ? 1 : @rooms.last.id + 1
    @rooms << room
    save_csv # this won't work because I didn't define this method in here
  end

  def all
    @rooms
  end

  private
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
      # row[:door_number] # => "Rock 01"
      # row[:number_of_beds] => "2"

      # 2nd iteration
      # row[:id] # => "2"
      # row[:door_number] # => "Pop 77"
      # row[:number_of_beds] => "10"

      row[:id] = row[:id].to_i
      row[:number_of_beds] = row[:number_of_beds].to_i


      @rooms << Room.new(row)
    end
  end

end

# repo = RoomRepository.new('rooms.csv')
# repo.all.each do |room|
#   puts room.door_number
#   puts room.full?
# end
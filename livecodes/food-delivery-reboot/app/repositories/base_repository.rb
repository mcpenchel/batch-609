class BaseRepository

  def initialize(csv_file_path, the_class)
    @class = the_class
    @csv_file_path = csv_file_path
    @elements = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def create(element)
    element.id = @elements.empty? ? 1 : @elements.last.id + 1
    @elements << element
    save_csv
  end

  private
  def save_csv
    csv_options = {
      col_sep: ",",
      quote_char: '"',
      force_quotes: true
    }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << @class.csv_headers
      @elements.each do |element|  
        csv << element.to_csv
      end
    end
  end

  def load_csv
    csv_options = {
      quote_char: '"',
      col_sep: ',',
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row = @class.prepare_row(row)

      @elements << @class.new(row)
    end
  end

end
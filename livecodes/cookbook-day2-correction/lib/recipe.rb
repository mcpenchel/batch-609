class Recipe
  attr_reader :name, :description, :rating, :prep_time

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @rating = attributes[:rating] || 0
    @done = attributes[:done] || false
    @prep_time = attributes[:prep_time] || "unknown"
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end
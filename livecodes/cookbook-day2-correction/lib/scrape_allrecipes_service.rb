class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
    @recipes_array = []
  end

  def call
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.card__detailsContainer').first(5).each do |element|
      name = element.search('.card__title').first.text.strip
      description = element.search('.card__summary').first.text.strip
      rating = element.search('.rating-star.active').size
      url = element.search('.card__titleLink').first.attribute('href').value

      # .rating-star .active
      # <div class="rating-star">
      #    <div class="active"></div>
      # </div>

      # .rating-star.active
      # <div class="rating-star active">
      # </div>

      @recipes_array << {
        name: name,
        description: description,
        rating: rating,
        url: url
      }
    end

    @recipes_array
  end

  def fetch_prep_time(index)
    html_file = URI.open(@recipes_array[index][:url]).read
    html_doc = Nokogiri::HTML(html_file)

    prep_time = ""

    html_doc.search('.recipe-meta-item').each do |element|
      if element.search('.recipe-meta-item-header').first.text.strip == "total:"
        prep_time = element.search('.recipe-meta-item-body').first.text.strip
      end
    end

    prep_time
  end
end
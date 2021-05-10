require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# To turn on the server, so that you can go to
# localhost:4567 in your browser, you need to
# run ruby app.rb in your terminal


# Route
# HTTP VERB "the-url"
get "/" do
  # Controller's method
  @restaurants = Restaurant.all.order("id DESC")

  # This will render the view index.erb which is
  # inside the views folder!
  erb :index
end

# Route
get "/restaurants/:id" do
  # Controller's method

  # The :id in the path of this route is a placeholder
  # which we can access by doing params[:id]

  # If in the browser we go to localhost:4567/restaurants/joao
  # params[:id] will be "joao"
  @restaurant = Restaurant.find(params[:id])

  erb :show
end

# Route
post "/restaurants" do
  # Controller's method
  # The key of the params hash is the NAME of the input!
  # Back in the form!

  # params[:name]
  # params[:address]
  # params[:capacity]

  restaurant = Restaurant.create(
    name: params[:name],
    address: params[:address],
    capacity: params[:capacity]
  )

  redirect "/restaurants/#{restaurant.id}"
end


# 1) Browser makes a GET request to a path ("/")
# 2) Sinatra's router checks if we accept get "/"
# 3) If it does, execute the code inside the block
# 4) Executes the view
# 5) Renders the view and sends it back to the browser
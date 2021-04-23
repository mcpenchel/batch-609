# When attempting to solve a complex challenge,
# make it work in the simplest scenario ever.

# And after that try to make it work for the more advanced parts.

def tag(tag_name, content, attributes = {})
  if attributes.keys.empty?
    "<#{tag_name}>#{content}</#{tag_name}>"
  else
    something = attributes.map { |key, value| " #{key}='#{value}'" }.join
    "<#{tag_name}#{something}>#{content}</#{tag_name}>"
  end
end

puts tag("h1", "Hello world")
# => <h1>Hello world</h1>

puts tag("h1", "Hello world", { class: "bold" })
# => <h1 class='bold'>Hello world</h1>

puts tag("a", "Le Wagon", { href: "http://lewagon.org", class: "btn" })
# => <a href='http://lewagon.org' class='btn'>Le Wagon</a>


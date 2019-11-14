require 'json'
require 'open-uri'

puts "cleans DB"
Ingredient.destroy_all

puts "populate DB with three ingredients... "

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

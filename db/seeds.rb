require 'json'
require 'open-uri'

puts "cleans DB"
Ingredient.destroy_all

puts "populate DB with ingredients... "

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "populate DB with cocktails... "

url_cocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"

cocktails = JSON.parse(open(url_cocktail).read)

cocktails["drinks"][0..20].reverse.each do |new_c|
  if Ingredient.exists?(["name = ?", "#{new_c["strIngredient1"]}"])
    ingredient_one = Ingredient.find_by("name = ?", new_c["strIngredient1"])
  else
    ingredient_one = Ingredient.create(name: new_c["strIngredient1"])
  end

  if Ingredient.exists?(["name = ?", "#{new_c["strIngredient2"]}"])
    ingredient_two = Ingredient.find_by("name = ?", new_c["strIngredient2"])
  else
    ingredient_two = Ingredient.create(name: new_c["strIngredient2"])
  end

  if Ingredient.exists?(["name = ?", "#{new_c["strIngredient3"]}"])
    ingredient_three = Ingredient.find_by("name = ?", new_c["strIngredient3"])
  else
    ingredient_three = Ingredient.create(name: new_c["strIngredient3"])
  end

  dose_one = Dose.new(description: new_c["strMeasure1"])
  dose_two = Dose.new(description: new_c["strMeasure2"])
  dose_three = Dose.new(description: new_c["strMeasure3"])

  dose_one.ingredient = ingredient_one
  dose_two.ingredient = ingredient_two
  dose_three.ingredient = ingredient_three
  doses = [dose_one, dose_two, dose_three]

  cocktail = Cocktail.create(name: new_c["strDrink"],
    instructions: new_c["strInstructions"],
    image_url: new_c["strDrinkThumb"])
  cocktail.doses = doses

  dose_one.save
  dose_two.save
  dose_three.save
end




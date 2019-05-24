require 'open-uri'
require 'json'

puts "Cleaning up database..."
[Cocktail, Ingredient].each(&:destroy_all)

COCKTAILS = ['WHITE RUSSIAN', 'BELLINI', 'CHAMPAGNE COCKTAIL', 'IRISH COFFEE', 'BAMBOO',
             'VODKA MARTINI', 'COSMOPOLITAN', 'OLD FASHIONED', 'MOJITO', 'MOSCOW MULE']

filepath = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(filepath).read

ingredients = JSON.parse(serialized_ingredients)
ingredients_array = []
ingredients['drinks'].each do |ingredient|
  ingredients_array << ingredient['strIngredient1']
end

puts 'seeding ingredient'


ingredients_array.each do |ingredient|
  Ingredient.create(
    name: ingredient
  )
end

puts 'end of seeding ingredient'

COCKTAILS.each do |cocktail|
  Cocktail.create(
    name: cocktail.downcase
  )
end

puts 'seeding cocktails'

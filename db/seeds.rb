# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require "json"
filepath_for_cocktails = 'db/cocktails.json'
# File.read gets the api locally and returns it as a string
serialized_cocktails = File.read(filepath_for_cocktails)
# JSON.parse turns that string into a hash
hash_of_cocktails = JSON.parse(serialized_cocktails)
hash_of_cocktails["cocktails"].each do |cocktail|
  puts "creating #{cocktail}"
  Cocktail.create(name: cocktail["name"])
end
puts "cocktails done"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
puts "pulling data from api"
# open(url).read gets the api from a url and returns it as a string
hash_of_ingredients = JSON.parse(open(url).read)
hash_of_ingredients["drinks"].each do |ingredient|
  puts "creating #{ingredient}"
  Ingredient.create(name: ingredient["strIngredient1"])
end
puts "ingredients done"


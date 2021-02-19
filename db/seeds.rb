# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require "json"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
puts "pulling data from api"
api_data = JSON.parse(open(url).read)
api_data["drinks"].each do |ingredient|
  puts "creating #{ingredient}"
  Ingredient.create(name: ingredient["strIngredient1"])
end
puts "done"



Cocktail.create(name: "mojito")
Cocktail.create(name: "bloody mary")
Cocktail.create(name: "pina colada")

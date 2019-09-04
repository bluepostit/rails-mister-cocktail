# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

def load_ingredients
  url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'.freeze
  json = JSON.parse(open(url).read)
  json['drinks'].map { |drink| drink['strIngredient1'] }
end

INGREDIENTS = load_ingredients

INGREDIENTS.each do |name|
  Ingredient.create(name: name)
end


# Black Russian
black_russian = Cocktail.create(name: "Black Russian")
dose1 = Dose.create(description: '1 part',
                    cocktail: black_russian,
                    ingredient: Ingredient.find_by(name: 'Kahlua'))

dose1 = Dose.create(description: '2 parts',
                    cocktail: black_russian,
                    ingredient: Ingredient.find_by(name: 'Vodka'))

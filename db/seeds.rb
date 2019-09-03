# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

INGREDIENTS = %w[lemon ice campari vodka ginger kahlua].freeze

INGREDIENTS.each do |name|
  Ingredient.create(name: name)
end


# Black Russian
black_russian = Cocktail.create(name: "Black Russian")
dose1 = Dose.create(description: '1 part',
                    cocktail: black_russian,
                    ingredient: Ingredient.find_by(name: 'kahlua'))

dose1 = Dose.create(description: '2 parts',
                    cocktail: black_russian,
                    ingredient: Ingredient.find_by(name: 'vodka'))

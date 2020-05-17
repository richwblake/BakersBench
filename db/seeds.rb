# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# -------- Special Pasta Test Recipe --------

Recipe.create(title: "Special Pasta", total_prep_time: "15 minutes")

tagliatelle = Ingredient.create(title: "Tagliatelle")
butter = Ingredient.create(title: "Butter")
garlic = Ingredient.create(title: "Garlic")
parmesan = Ingredient.create(title: "Parmesan")

Amount.create(mass: 500, ingredient: tagliatelle)
Amount.create(mass: 25, ingredient: butter)
Amount.create(mass: 5, ingredient: garlic)
Amount.create(mass: 20, ingredient: parmesan)

IngredientType.create(type_of_ingredient: "pasta", ingredient: tagliatelle)
IngredientType.create(type_of_ingredient: "fat", ingredient: butter)
IngredientType.create(type_of_ingredient: "vegetable", ingredient: garlic)
IngredientType.create(type_of_ingredient: "cheese", ingredient: parmesan)
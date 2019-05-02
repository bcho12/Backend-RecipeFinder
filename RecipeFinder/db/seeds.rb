# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "brian", password: "1234")
u2 = User.create(username: "james", password: "12345")
u3 = User.create(username: "heather", password: "123456")

recipe1 = Recipe.create(title: "Meatloaf", href: "google.com", ingredients: "tomato, spinach", thumbnail: "https://images-gmi-pmc.edge-generalmills.com/3e0ded09-f8a2-45b6-aff7-e08ab138ed84.jpg")
recipe2 = Recipe.create(title: "Lasagna", href: "facebook.com", ingredients: "oregano, spinach, lettuce", thumbnail: "https://www.thewholesomedish.com/wp-content/uploads/2018/07/Best-Lasagna-550-500x500.jpg")
recipe3 = Recipe.create(title: "Spaghetti", href: "yahoo.com", ingredients: "tomato, spinach, garlic", thumbnail: "https://www.skinnytaste.com/wp-content/uploads/2017/10/One-Pot-Spaghetti-and-Meat-Sauce-1-2.jpg")
recipe4 = Recipe.create(title: "Hamburger", href: "youtube.com", ingredients: "salt, spinach, onion", thumbnail: "https://assets.epicurious.com/photos/57c5c6d9cf9e9ad43de2d96e/master/pass/the-ultimate-hamburger.jpg")

f1 = Favorite.create( user_id: 1, recipe_id: 1)
f2 = Favorite.create( user_id: 1, recipe_id: 2)
f3 = Favorite.create( user_id: 2, recipe_id: 1)
f4 = Favorite.create( user_id: 2, recipe_id: 2)
f5 = Favorite.create( user_id: 2, recipe_id: 3)
f6 = Favorite.create( user_id: 3, recipe_id: 2)
f7 = Favorite.create( user_id: 3, recipe_id: 3)
f8 = Favorite.create( user_id: 3, recipe_id: 4)


Restaurant.destroy_all
User.destroy_all

bravo = Restaurant.create(name: "Bravo", cuisine: "Italian", location: "11 Broadway")
chipotle = Restaurant.create(name: "Chipotle", cuisine: "Mexican", location: "12 Broadway")
route66 = Restaurant.create(name: "Route 66 BBQ", cuisine: "American", location: "1 Rodeo Dr")

zev = User.create(name: "Zev", fav_food: "Burgers", fav_cuisine: "American")
sivan = User.create(name: "Sivan",fav_food: "Pasta", fav_cuisine: "Italian")



d1 = DishPost.create(name: "Best Burgers", rating: 7, restaurant_id: chipotle.id, user_id: sivan.id)
# # DishPost.new(name: "Best Burgers", rating: 7, restaurant_id: , user_id: )
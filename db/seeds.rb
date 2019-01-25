
Restaurant.destroy_all
User.destroy_all
DishPost.destroy_all

bravo = Restaurant.create(name: "Bravo", cuisine: "Italian", location: "11 Broadway")
chipotle = Restaurant.create(name: "Chipotle", cuisine: "Mexican", location: "12 Broadway")
route66 = Restaurant.create(name: "Route 66 BBQ", cuisine: "American", location: "1 Rodeo Dr")
hillstone = Restaurant.create(name: "Hillstone", cuisine: "American", location: "NYC")
cheesecake = Restaurant.create(name: "Cheesecake Factory", cuisine: "American", location: "everywhere")

zev = User.create(name: "Zev", fav_food: "Burgers", fav_cuisine: "American")
sivan = User.create(name: "Sivan",fav_food: "Pasta", fav_cuisine: "Italian")
mike = User.create(name: "Mike",fav_food: "Burritos", fav_cuisine: "Mexican")
flyguy54 = User.create(name: "flyguy54",fav_food: "Tacos", fav_cuisine: "Mexican")


d1 = DishPost.create(name: "Burgers", rating: 7, restaurant_id: hillstone.id, user_id: sivan.id, meal_description: "GREAT BURGER")
d2 = DishPost.create(name: "Burritos", rating: 9, restaurant_id: chipotle.id, user_id: mike.id, meal_description: "SUCH A GREAT BURRITO")
d3 = DishPost.create(name: "Burgers", rating: 9, restaurant_id: route66.id, user_id: zev.id, meal_description: "even better burger!!!")
d4 = DishPost.create(name: "Burritos", rating: 3, restaurant_id: chipotle.id, user_id: sivan.id, meal_description: "ehhhhh")
d5 = DishPost.create(name: "Nachos", rating: 10, restaurant_id: chipotle.id, user_id: sivan.id, meal_description: "WOW")
d6 = DishPost.create(name: "Pasta", rating: 10, restaurant_id: cheesecake.id, user_id: sivan.id, meal_description: "WOW")
d7 = DishPost.create(name: "Pasta", rating: 10, restaurant_id: hillstone.id, user_id: sivan.id, meal_description: "WOW")
d8 = DishPost.create(name: "Pizza", rating: 8, restaurant_id: bravo.id, user_id: zev.id, meal_description: "omg")
# # DishPost.new(name: "Best Burgers", rating: 7, restaurant_id: , user_id: )

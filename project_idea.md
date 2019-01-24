

What we've done:
----------------
*Average Rating of a restaurant
*Found posts by a users fav_food
*Found restaurants by a users fav_food
*Found restaurants that search for any type of food input
*New post, if the restaurant isnt in database, it creates it
*New user
*Found restaurants with top rated inputed foods
*Found a restaurants top rated item


***************INTERFACE***************
- Open App
- Welcome user to Foodie
- 1. if you have an account && 2. if you're a new user
  - IF 1: Enter Username
  - IF 2: Create account (gets.chomp stuff we did)
- We're in!
- 1. to create new post && 2. to search existing posts
  -IF 1: Create Post (gets.chomp stuff we did)
  -IF 2: ANOTHER MENU: 1.To find a restaurant with your fav food, 2. To find a restaurant with a specific food, 3. To find all posts about a restaurant, 4. To find top rated item in a restaurant
***************************************



I'm hungry and I don't know where to go. I want pizza... where's the best rated pizza?

I'm at Bravos and don't know what to get. What's the top rated menu item at this restaurant?

WE DID THAT --> I just ate a really good steak at Bravos and I took a photo that I want to save and post... How?!?!

I can't eat nuts, find my dishes that don't have nuts.

Restaurant ---< Dish Posts >--- User

DishPosts
name: string
type: string
rating: integer
contains allergen ingredients: boolean
restaurant_id: integer
user_id: integer

Restaurant
name: string
cuisine: string
location: string

User
name: string
fav_food: string
fav_cuisine: integer

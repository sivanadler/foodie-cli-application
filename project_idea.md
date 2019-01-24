##Foodie: A Super Original App
Mod 1 Final Project

## INSTALL
In order to run this app, first clone down this repo to your local machine. Next, run 'bundle install' in your terminal.

## DESCRIPTION
Okay, you've got our gems and you've got our code. Now, let's get started. FOODIE is an app where you (a user) can post about food you LOVE (or HATE), write a description and rate what you ate. A user can also look up what/where to eat. When a user creates their profile, they save information like "Fav Food", which they can search by in this app to find restaurants that serve that item. There are many ways to search, you'll have to download the app to find out the rest!

## INSTRUCTIONS
1. In your command line, run 'ruby ./bin/run.rb'.
2. Now you're on the home page. You can navigate the app with the arrow keys and select a field by hitting enter. Either sign in if you have an account, or feel free to create yourself an account.
  - IF you're creating an account, answer some questions and Foodie will store your info in your profile.
  - IF you've got an account, sign in... Foodie has your info!
3. Ok... now we're in! You're seeing the main menu. You've got two options. You can either create a new post (maybe you ate something awesome and want everyone to know) OR you can just search Foodie for suggestions on what/where to get lunch today.
  - IF you're creating a new post, move to step 4
  - IF you're searching, move to step 5
4. To create a post, just answer some questions and your post will be saved!
5. If you're searching the app, there's a lot you can search for. Navigate the search menu with the arrow keys to search for whatever you're in the mood for.
6. Once you've finished a post or a search, you'll have the option to either continue back to the main menu, or just exit. Make your selection and enjoy!

## CONTRIBUTORS GUIDE
1. Fork and clone this repo
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## LICENSE


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

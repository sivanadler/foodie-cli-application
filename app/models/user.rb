class User < ActiveRecord::Base
  has_many :dish_posts
  has_many :restaurants, through: :dish_posts

  def self.new_user
    puts "Hey there! First time with us? Great! Register here. Don't worry, you'll only have to do this once..."
    puts "Create a username:"
    user_name = gets.chomp
    if user_name == ""
      error_message
    else
    end
    puts "Favorite Food:"
    my_fav_food = gets.chomp
    puts "Favorite cuisine:"
    my_fav_cuisine = gets.chomp
    self.create(name: user_name, fav_food: my_fav_food, fav_cuisine: my_fav_cuisine)
  end

  def self.error_message
    puts "This field is required. Please try again..."
    new_user
  end

  def fav_food_posts
    postsArr = DishPost.where name: self.fav_food
  end

  def restaurant_with_fav_food
    newArr = []
    array_of_hashes = []
    restaurant_list = self.fav_food_posts.pluck(:restaurant_id)
    rest_arr = Restaurant.find(restaurant_list)
    rest_arr.each do |rest|
      newArr << [restaurant_name: rest.name, location: rest.location]
      array_of_hashes = newArr.uniq.flatten
    binding.pry
    end
    rest_list = array_of_hashes.map do |item|
      "-Restaurant: #{item[:restaurant_name]}, Location: #{item[:location]}"
    end
    puts rest_list
  end

  def search_for(food)
    search = DishPost.where name: food
    restaurant_list = search.pluck(:restaurant_id)
    Restaurant.find(restaurant_list)
  end

  def search_for_best_rated(food)
    search = DishPost.where name: food
    sorted = search.sort_by(&:rating).reverse
    restaurant_list = sorted.pluck(:restaurant_id)
    Restaurant.find(restaurant_list)
  end
end

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
    # keyArr = ["name", "rating"]
    # print_from_db(postsArr, keyArr)
  end

# postsArr.each do |post|
#   keyArr.each do |key|
#     "#{key} - #{post[key]}"
#   end
# end

  def restaurant_with_fav_food
    newArr = []
    avg = nil
    array_of_hashes = []

    restaurant_list = self.fav_food_posts.pluck(:restaurant_id)
    rest_arr = Restaurant.find(restaurant_list)

    rest_arr.each do |rest|
      avg = rest.average_restaurant_rating
      newArr << [restaurant_name: rest.name, location: rest.location, avg_rating: avg]
      array_of_hashes = newArr.uniq.flatten
    end
    rest_list = array_of_hashes.map do |item|
      "** Restaurant: #{item[:restaurant_name]}, Location: #{item[:location]}, Average Restaurant Rating: #{item[:avg_rating]}."
    end
    puts rest_list
  end

  def search_for(food)
    newArr = []
    avg = nil
    array_of_hashes = []

    search = DishPost.where name: food
    restaurant_list = search.pluck(:restaurant_id)
    updated_list = Restaurant.find(restaurant_list)

    updated_list.each do |rest|
      avg = rest.average_restaurant_rating
      newArr << [restaurant_name: rest.name, location: rest.location, avg_rating: avg]
      array_of_hashes = newArr.uniq.flatten
    end
    rest_list = array_of_hashes.map do |item|
      "** Restaurant: #{item[:restaurant_name]}, Location: #{item[:location]}, Average Restaurant Rating: #{item[:avg_rating]}."
    end
    puts rest_list
  end

  def get_food_posts(food)
    list_item = []
    all = DishPost.all.where name: food
    all.each do |post|
      rest = Restaurant.find_by id: post.restaurant_id
      user = User.find_by id: post.user_id
      list_item << "** Item: #{post.name}, Description: #{post.meal_description}, Rating: #{post.rating}, Restaurant: #{rest.name}, User: #{user.name}"
    end
    puts list_item
  end

  def get_restaurant_posts(restaurant)
    list_item = []
    var = Restaurant.find_by name: restaurant
    all = DishPost.all.where restaurant_id: var.id
    all.each do |post|
      rest = Restaurant.find_by id: post.restaurant_id
      user = User.find_by id: post.user_id
      list_item << "** Item: #{post.name}, Description: #{post.meal_description}, Rating: #{post.rating}, Restaurant: #{rest.name}, User: #{user.name}"
    end
    puts list_item
  end

  def search_for_best_rated(food)
    search = DishPost.where name: food
    sorted = search.sort_by(&:rating).reverse
    restaurant_list = sorted.pluck(:restaurant_id)
    Restaurant.find(restaurant_list)
  end
end

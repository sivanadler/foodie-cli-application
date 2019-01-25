class User < ActiveRecord::Base
  has_many :dish_posts
  has_many :restaurants, through: :dish_posts

  def self.new_user
    puts "Hey there! First time with us? Great! Register here. Don't worry, you'll only have to do this once...".blue
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_name = prompt.ask("What is your name?".blue.bold) do |q|
      q.required true
    end
    puts "Favorite Food:".blue.bold
    my_fav_food = gets.chomp.pluralize
    puts "Favorite cuisine:".blue.bold
    my_fav_cuisine = gets.chomp
    self.create(name: user_name, fav_food: my_fav_food, fav_cuisine: my_fav_cuisine)
  end

  def fav_food_posts
    postsArr = DishPost.where name: self.fav_food
  end

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
      "** Restaurant: #{item[:restaurant_name]}, Location: #{item[:location]}, Average Restaurant Rating: #{item[:avg_rating]}.".green
    end
    if rest_list != []
      puts "These restaurants have #{self.fav_food.pluralize}:".bold.green
      puts rest_list
    elsif rest_list == []
      puts "There are no posts about #{self.fav_food.pluralize}".bold.green
    end
  end

  def search_for(food)
    food = food.pluralize
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
      "** Restaurant: #{item[:restaurant_name]}, Location: #{item[:location]}, Average Restaurant Rating: #{item[:avg_rating]}.".green
    end
    if rest_list != []
      puts "These restaurants have #{food.pluralize}:".bold.green
      puts rest_list
    elsif rest_list == []
      puts "There are no posts about #{food.pluralize}".bold.red
    end
  end

  def get_food_posts(food)
    food = food.pluralize
    list_item = []
    all = DishPost.all.where name: food
    all.each do |post|
      rest = Restaurant.find_by id: post.restaurant_id
      user = User.find_by id: post.user_id
      list_item << "** Item: #{post.name}, Description: #{post.meal_description}, Rating: #{post.rating}, Restaurant: #{rest.name}, User: #{user.name}".green
    end
    if list_item != []
      puts "These posts are about #{food.pluralize}:".bold.green
      puts list_item
    elsif list_item == []
      puts "There are no posts about #{food.pluralize}".bold.red
    end
  end

end #end of class

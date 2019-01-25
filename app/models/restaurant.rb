class Restaurant < ActiveRecord::Base
  has_many :dish_posts
  has_many :users, through: :dish_posts

  def self.new_restaurant
    puts "You're the first person to post about this restaurant! Tell us a little bit about it! (try telling them you posted about them and maybe they'll give you a discount...? *** not guranteed but try ***)".blue
    prompt = TTY::Prompt.new(active_color: :magenta)
    restaurant_name = prompt.ask("Restaurant name:".blue.bold) do |q|
      q.required true
    end
    prompt = TTY::Prompt.new(active_color: :magenta)
    my_rest_cuisine = prompt.ask("Cuisine:".blue.bold) do |q|
      q.required true
    end
    prompt = TTY::Prompt.new(active_color: :magenta)
    my_location = prompt.ask("Location:".blue.bold) do |q|
      q.required true
    end
    self.create(name: restaurant_name, cuisine: my_rest_cuisine, location: my_location)
    puts "Thanks! We've saved this restaurant. Continue with creating your post!".green
  end

  def average_restaurant_rating
    ratings = []
    DishPost.all.map do |post|
      if post.restaurant_id == self.id
        ratings << post.rating
      end
    end
    ratings.inject{ |sum, a| sum + a}.to_f / ratings.size.to_f
  end

  def average_dish_rating(dish)
    ratings = []
    DishPost.all.map do |post|
      if post.name == dish
        ratings << post.rating
      end
    end
    ratings.inject{ |sum, a| sum + a}.to_f / ratings.size.to_f
  end

  def raw_rating_data_helper
    newArr = []
    avg = nil
    array_of_hashes = []
    search = DishPost.where restaurant: self.id
    search.each do |post|
      avg = self.average_dish_rating(post.name)
      newArr << [menu_item: post.name, rating: avg]
      array_of_hashes = newArr.uniq.flatten
    end
    array_of_hashes
  end

  def find_items_and_ratings
    array_of_hashes = self.raw_rating_data_helper
    sorted = array_of_hashes.sort_by { |key, value| value }
    answer = sorted.to_a
    item_ratings = answer.map do |item|
      "** #{item[:menu_item]}, Rating: #{item[:rating]}".green
    end
    puts item_ratings
  end

  def top_rated_item
    array_of_hashes = self.raw_rating_data_helper
    sorted = array_of_hashes.sort_by { |key, value| value }
    answer = sorted.reverse[0]
    puts "** Top Rated Item: #{answer[:menu_item]}, Average Rating: #{answer[:rating]}! **".green
  end

  def self.get_cuisine_posts(cuisine)
    list_item = []
    var = self.all.where cuisine: cuisine
    var.each do |rest|
      list_item << "** Restaurant: #{rest.name}, Location: #{rest.location}, Rating: #{rest.average_restaurant_rating}".green
    end
    if list_item == []
      puts "There are no posts about restaurants that serve #{cuisine} food yet.".red
    elsif list_item
      puts "Restaurants that serve #{cuisine} food:".green
      puts list_item
    end
  end

  def self.get_restaurant_posts(restaurant)
    list_item = []
    var = Restaurant.find_by name: restaurant
    all = DishPost.all.where restaurant_id: var.id
    all.each do |post|
      rest = Restaurant.find_by id: post.restaurant_id
      user = User.find_by id: post.user_id
      list_item << "** Restaurant: #{rest.name}, Cuisine: #{rest.cuisine}, Posted About: #{post.name}, Description: #{post.meal_description}, Rating: #{post.rating}, Posted By: #{user.name}".green
    end
    if list_item == []
      puts "There are no posts about #{restaurant} yet.".red
    elsif  list_item
      puts "Posts about #{restaurant}:".green
      puts list_item
    end
  end

end

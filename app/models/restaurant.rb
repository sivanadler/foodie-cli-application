class Restaurant < ActiveRecord::Base
  has_many :dish_posts
  has_many :users, through: :dish_posts

  def self.new_restaurant
    puts "Hey there!"
    puts "What was the Restaurant name?"
    restaurant_name = gets.chomp
    if restaurant_name == ""
      error_message
    else
    puts "What cuisine was it?"
    my_rest_cuisine = gets.chomp
    if my_rest_cuisine == ""
      error_message
    else
    puts "Where was it?"
    my_location = gets.chomp
    if my_location == ""
      error_message
    else
    self.create(name: restaurant_name, cuisine: my_rest_cuisine, location: my_location)
    end
    end
    end
  end

  def self.error_message
    puts "This field is required. Please try again."
    new_restaurant
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

  def top_rated_item
    newArr = []
    avg = nil
    array_of_hashes = []
    search = DishPost.where restaurant: self.id
    search.each do |post|
      avg = self.average_dish_rating(post.name)
      newArr << [menu_item: post.name, rating: avg]
      array_of_hashes = newArr.uniq.flatten
    end
    sorted = array_of_hashes.sort_by { |key, value| value }
    answer = sorted.reverse[0].to_a
    puts "#{answer[0][1]} is the top rated item. It's average rating is #{answer[1][1]}!"
  end
end

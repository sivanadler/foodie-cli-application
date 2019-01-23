class Restaurant < ActiveRecord::Base
  has_many :dish_posts
  has_many :users, through: :dish_posts

  def self.new_restaurant
    puts "Hey there!"
    puts "What is your Restaurant name?"
    restaurant_name = gets.chomp
    if restaurant_name == ""
      error_message
    else
    puts "What cuisine?"
    my_rest_cuisine = gets.chomp
    if my_rest_cuisine == ""
      error_message
    else
    puts "Where you at?"
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

  def average_rating
    ratings = []
    DishPost.all.map do |post|
      if post.restaurant_id == self.id
        ratings << post.rating
      end
    end
    ratings.inject{ |sum, a| sum + a}.to_f / ratings.size.to_f
  end
end

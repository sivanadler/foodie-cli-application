class User < ActiveRecord::Base
  has_many :dish_posts
  has_many :restaurants, through: :dish_posts

  def self.new_user
    puts "Hey there!"
    puts "What is your name?"
    user_name = gets.chomp
    if user_name == ""
      error_message
    else
    puts "Got a favorite food? Tell us!"
    my_fav_food = gets.chomp
    puts "Favorite cuisine? Tell us!"
    my_fav_cuisine = gets.chomp
    self.create(name: user_name, fav_food: my_fav_food, fav_cuisine: my_fav_cuisine)
    end
  end

  def self.error_message
    puts "This field is required. Please try again..."
    new_user
  end
end

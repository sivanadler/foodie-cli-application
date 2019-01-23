class DishPost < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  def self.new_post
    puts "Did you eat something awesome? Tell us..."
    puts "What's your name?"
    my_name = gets.chomp
    if my_name == ""
      error_message
    else
      find_by_my_name = User.find_by name: my_name
    puts "Where did you eat?"
    my_rest = gets.chomp
    if my_rest == ""
      error_message
    else
      find_by_my_rest = Restaurant.find_by name: my_rest
    puts "Meal Description: "
    meal_desc = gets.chomp
    puts "If you could rate this meal from 1-10, what would you rate it?"
    my_rating = gets.to_i
    if my_rating == 0
      error_message_for_syntax
    else
    self.create(name: meal_desc, rating: my_rating, restaurant_id: find_by_my_rest.id, user_id: find_by_my_name.id)
    end
    end
    end
  end

  def self.error_message
    puts "This field is required, please try again."
    new_post
  end

  def self.error_message_for_syntax
    puts "This field requires an number rating."
    new_post
  end
end

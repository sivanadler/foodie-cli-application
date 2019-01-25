class DishPost < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  def self.new_post(user)
    puts "Did you eat something awesome? Tell us...".bold
    @my_name = user
    find_by_my_name = User.find_by name: @my_name
    puts "Where did you eat?".bold
    my_rest = gets.chomp
    if my_rest == ""
      error_message
    else
      find_by_my_rest = Restaurant.find_by name: my_rest
      if find_by_my_rest == nil
        find_by_my_rest = Restaurant.new_restaurant
      end
    end
    puts "What did you eat there?".bold
    i_ate = gets.chomp.pluralize
    if i_ate == ""
      error_message
    end
    puts "Meal Description: ".bold
    meal_desc = gets.chomp
    prompt = TTY::Prompt.new(active_color: :magenta)
    my_rating = prompt.slider('Rating:'.bold, max: 10, step: 1)
    self.create(name: i_ate, rating: my_rating, restaurant_id: find_by_my_rest.id, user_id: find_by_my_name.id, meal_description: meal_desc)
  end # end of new post method

  def self.error_message
    puts "This field is required, please try again.".red.bold
    new_post(@my_name)
  end

end #end of class

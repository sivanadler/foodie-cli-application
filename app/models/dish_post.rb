class DishPost < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  def self.new_post(user)
    puts "Did you eat something awesome? Tell us..."
    @my_name = user
    find_by_my_name = User.find_by name: @my_name
    prompt = TTY::Prompt.new(active_color: :magenta)
    my_rest = prompt.ask("Where did you eat?:") do |q|
      q.required true
    end
    find_by_my_rest = Restaurant.find_by name: my_rest
    if find_by_my_rest == nil
      find_by_my_rest == Restaurant.new_restaurant
    else
    end
    prompt = TTY::Prompt.new(active_color: :magenta)
    i_ate = prompt.ask("What did you eat?:") do |q|
      q.required true
    end
    puts "Meal Description: "
    meal_desc = gets.chomp
    prompt = TTY::Prompt.new(active_color: :magenta)
    my_rating = prompt.slider('Rating:', max: 10, step: 1)
    self.create(name: i_ate.pluralize, rating: my_rating, restaurant_id: @new.id, user_id: find_by_my_name.id, meal_description: meal_desc)
  end
end #end of class

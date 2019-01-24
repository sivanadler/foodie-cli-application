class CommandLineInterface

  def greet
    puts 'Welcome to Foodie, the best app for restaurant searching your fav foods and restaurants!!'
  end

  def sign_in
    puts "Enter Username:"
    @user = gets.chomp
    puts "Hey #{@user}! Welcome back!"
    @user
  end

  def search_for
    my_db = []
    User.all.each do |user|
      my_db << user.name
    end
    if my_db.include?(@user)
      main_menu
    else
      create_profile
    end
    return "done"
  end

  def create_profile
    new_user = User.new_user
    main_menu
    return "done"
  end

  def main_menu
    puts "*** MAIN MENU ***"
    puts "Enter 1 to create a new post. Enter 2 to search existing posts:"
    user_input = gets.chomp
    if user_input == "1"
      create_new_post
    elsif user_input == "2"
      search_db
    else
      puts "Wrong input. Please input '1' or '2' to continue."
      main_menu
    end
  end

  def create_new_post
    new_post = DishPost.new_post(@user)
    return "nice post!"
  end

  def search_db
    puts " ******* Enter 1 to find restaurants with your fav food ******* "
    puts " ******* Enter 2 to find posts about a specific food ******* "
    puts " ******* Enter 3 to find restaurants with a specific food ******* "
    puts " ******* Enter 4 to see all posts about a specific restaurant ******* "
    puts " ******* Enter 5 to find the top rated item at a specific restaurant ******* "
    user_input = gets.chomp
    if user_input == "1"
      grab_user_instance.restaurant_with_fav_food
      done_with_whatever
    elsif user_input == "2"
      puts "Enter food item:"
      food = gets.chomp
      grab_user_instance.get_food_posts(food)
      done_with_whatever
    elsif user_input == "3"
      puts "Enter food item:"
      food = gets.chomp
      grab_user_instance.search_for(food)
      done_with_whatever
    elsif user_input == "4"
      puts "Enter restaurant:"
      restaurant = gets.chomp
      grab_user_instance.get_restaurant_posts(restaurant)
      done_with_whatever
    elsif user_input == "5"
      puts "Enter Restaurant:"
      @restaurant = gets.chomp
      grab_rest_instance.top_rated_item
      done_with_whatever
    else
      puts "Wrong input. Please input a number between 1 and 5 to continue."
    end
  end

  def grab_user_instance
    @user_instance = User.find_by name: @user
    @user_instance
  end

  def grab_rest_instance
    @rest_instance = Restaurant.find_by name: @restaurant
    @rest_instance
  end

  def done_with_whatever
    puts "Main Menu? Y/N"
    yes_or_no = gets.chomp
    if yes_or_no == "Y"
      main_menu
    else
      puts "Have a great day!!"
    end
  end

end #end of class

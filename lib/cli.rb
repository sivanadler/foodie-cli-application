class CommandLineInterface

  def greet
    font = TTY::Font.new(:starwars)
    pastel = Pastel.new
    puts pastel.magenta(font.write("FOODIE"))
    puts 'Welcome to Foodie, the best app for restaurant searching your fav foods and restaurants!! (and SUPER ORIGINAL!)'
  end

  def greet_menu
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_input = prompt.select("~~~~~~~~~~~~ HOME ~~~~~~~~~~~~".red) do |menu|
      menu.choice name: 'Sign In',  value: 1
      menu.choice name: 'Create Account', value: 2
    end
    if user_input == 1
      sign_in
    elsif user_input == 2
      create_profile
    end
  end

  def sign_in
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_name = prompt.ask("Enter Username:") do |q|
      q.required true
    end
    @user = user_name
    search_for
  end

  def search_for
    my_db = []
    User.all.each do |user|
      my_db << user.name
    end
    if my_db.include?(@user)
      puts "Hey #{@user}! Welcome back!".green
      @user
      main_menu
    else
      create_profile
    end
    return "done"
  end

  def create_profile
    new_user = User.new_user
    puts "Welcome #{new_user.name}! Your account was created!".green
    main_menu
    return "done"
  end

  def main_menu
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_input = prompt.select("~~~~~~~~~~~~ MAIN MENU ~~~~~~~~~~~~".red) do |menu|
      menu.choice name: 'New Post',  value: 1
      menu.choice name: 'Search App', value: 2
    end
    if user_input == 1
      create_new_post
    elsif user_input == 2
      search_db
    end
  end

  def create_new_post
    new_post = DishPost.new_post(@user)
    puts "Your post has been saved!".green
    done_with_whatever
  end

  def search_db
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_input = prompt.select("~~~~~~~~~~~~ SEARCH ~~~~~~~~~~~~".red) do |menu|
      menu.choice name: 'Restaurants with your fav food',  value: 1
      menu.choice name: 'Search for posts by food', value: 2
      menu.choice name: 'Search for restaurants by food', value: 3
      menu.choice name: 'Review posts by restaurant', value: 4
      menu.choice name: 'Find top rated item at a restaurant', value: 5
      menu.choice name: 'Search for restaurants by cuisine', value: 6
    end
    if user_input == 1
      grab_user_instance.restaurant_with_fav_food
      done_with_whatever
    elsif user_input == 2
      puts "Enter food item:"
      food = gets.chomp
      grab_user_instance.get_food_posts(food)
      done_with_whatever
    elsif user_input == 3
      puts "Enter food item:"
      food = gets.chomp
      grab_user_instance.search_for(food)
      done_with_whatever
    elsif user_input == 4
      puts "Enter restaurant:"
      restaurant = gets.chomp
      grab_user_instance.get_restaurant_posts(restaurant)
      done_with_whatever
    elsif user_input == 5
      puts "Enter Restaurant:"
      @restaurant = gets.chomp
      grab_rest_instance.top_rated_item
      done_with_whatever
    elsif user_input == 6
      puts "Enter Cuisine:"
      cuisine = gets.chomp
      Restaurant.get_cuisine_posts(cuisine)
      done_with_whatever
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
    prompt = TTY::Prompt.new(active_color: :magenta)
    user_input = prompt.select("~~~~~~~~~~~~ DONE ~~~~~~~~~~~~".red) do |menu|
      menu.choice name: 'Back to Main Menu?',  value: 1
      menu.choice name: 'Exit', value: 2
    end
    if user_input == 1
      main_menu
    elsif user_input == 2
      puts "Bye Bye!".blue
    else
      puts "~~~~~~~~~~~~bye~~~~~~~~~~~~".red
    end
  end

end #end of class

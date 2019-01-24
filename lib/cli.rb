class CommandLineInterface
  def greet
    puts 'Welcome to Foodie, the best app for restaurant searching your fav foods and restaurants'
  end

  def sign_in
    puts "Enter Username:"
    user_name = gets.chomp
    puts "Hey #{user_name}!"
    user_name
  end

  def search_for(user_name)
    User.all.find do |user|
      if user.name == user_name
          binding.pry
        menu
        return "blah"
      else
        create_profile
      end
    end
    return "done"
  end

  def create_profile
    new_user = User.new_user
    menu
    return "done"
    binding.pry
  end

  def menu
    puts "YOU MADE IT"
  end

end

class CommandLineInterface < ActiveRecord::Base
  def greet
    puts 'Welcome to Foodie, the best app for restaurant searching your fav foods and restaurants'
  end

  def sign_in
    puts "Enter Username:"
    user_name = gets.chomp
    puts "Hey #{user_name}!"
  end

  def search_for
    if User.exists?(:name == sign_in)
      binding.pry
      menu
    else
      create_profile
    end
  end

  def create_profile
    new_user = User.new_user
  end

  def menu
  end

end

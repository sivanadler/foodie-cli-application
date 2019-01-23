require_relative '../config/environment'
require 'pry'

cli = CommandLineInterface.new
cli.greet
user_name = cli.sign_in
# cli.search_for

binding.pry
puts "HELLO WORLD"

require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new

cli = CommandLineInterface.new
cli.greet
cli.greet_menu


binding.pry
puts "SEE YA"

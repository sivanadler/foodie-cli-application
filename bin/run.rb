require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new

cli = CommandLineInterface.new
cli.greet
cli.greet_menu


binding.pry
font = TTY::Font.new(:starwars)
pastel = Pastel.new
puts pastel.magenta(font.write(" SEE  YA "))

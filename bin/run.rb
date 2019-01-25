require_relative '../config/environment'
require 'pry'
prompt = TTY::Prompt.new

cli = CommandLineInterface.new
cli.greet
cli.greet_menu

font = TTY::Font.new(:starwars)
pastel = Pastel.new
puts pastel.magenta.bold(font.write(" SEE  YA !!"))

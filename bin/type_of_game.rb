# Prompt the user for what kind of game they want to play, 0,1, or 2 player
require 'pry'

def type_of_game
  puts "How many players do you want in your game 0,1, or 2?"
  type_of_game = gets.strip
  binding.pry
end

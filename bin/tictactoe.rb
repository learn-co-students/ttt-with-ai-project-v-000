#!/usr/bin/env ruby
require_relative '../config/environment'

# Game.new.play

def player_number
  puts "Please select the number of players: 0, 1, or 2"
  gets.strip
end

def first_player
  # Ask the user for who should go first and be "X".
  puts "X goes first. Would you like to be X:  yes / no"
  gets.strip.downcase
end

play_again = "yes"
while play_again == "yes"
  # Greet the user with a message.
  puts "Welcome to Tic Tac Toe with AI"
  # Prompt the user for what kind of game they want to play, 0, 1, or 2 player.
  user_input = player_number
  binding.pry
  # Use the input to correctly initialize a Game with the appropriate player types and token values.
  if user_input == "0"
     # start AI game automatically
     Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  elsif user_input == "1"
     if first_player == "yes"
        Game.new(Players::Human.new("X"),Players::Computer.new("O")).play
     elsif first_player == "no"
        Game.new.play
     else
        puts "Invalid input."
        first_player
     end
  elsif user_input == "2"
     Game.new(Players::Human.new("X"),Players::Human.new("O")).play
  else
    puts "Invalid input."
    player_number
  end

  # When the game is over, the CLI should prompt the user if they would like to play again
  puts "Would you like to play again?"
  play_again = gets.strip
end

#If the user doesn't want to play again, exit the program.
puts "Until next time."
puts "End of line"

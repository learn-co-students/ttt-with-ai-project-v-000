#!/usr/bin/env ruby
require_relative '../config/environment'

ttt = Cli.new

while ttt.play == "yes"
  # Greet the user with a message
  ttt.greet_user

  # Prompt the user for what kind of game they want to play, 0, 1, or 2 player.
  user_input = ttt.player_number

  # Use the input to correctly initialize a Game with the appropriate player types and token values.
  if user_input == "0"
     # start AI game automatically
     #functionality still needed
     Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
     ttt.another_round
  elsif user_input == "1"
    # Ask the user for who should go first and be "X"
     ttt.play_x_starts
     ttt.turn
     ttt.another_round
  elsif user_input == "2"
     ttt.play_x_starts
     Game.new(Players::Human.new("X"), Players::Human.new("O")).play
     ttt.another_round
  else
    ttt.invalid_input
    ttt.player_number
  end
end

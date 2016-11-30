#!/usr/bin/env ruby

require_relative '../config/environment'
require 'pry'

class CLI

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players: 0, 1 or 2?"

    human_response = gets.strip.to_i

    if human_reponse.between?(0,2) == false
      puts "Invalid entry. Please start again."
      start
    elsif human_response == 0
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
 +      new_game.play
    elsif human_response == 1
      puts "Hello, please enter your name:"
      player1 = gets.strip
      puts "Hello #{player1}! You will be X and the computer will be O."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      new_game.board.first_display
      new_game.play
    elsif human_response == 2
      puts "Who wants to be player 1?"
      puts "Please enter your name:"
      player1 = gets.strip
      puts "Hello #{Player1}, you will be player X."
      puts "Player 2, please enter your name:"
      player2 = gets.strip
      puts "Hello #{Player2}, you will be player 0."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      new_game.board.first_display
      new_game.play
    end

  end
end

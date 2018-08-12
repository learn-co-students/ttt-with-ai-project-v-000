#!/usr/bin/env ruby

require_relative '../config/environment'

def start
   puts %q[
  _  _     _           _                   
 | \| |___| |_ ___ _ _(_)___ _  _ ___      
 | .` / _ \  _/ _ \ '_| / _ \ || (_-<      
 |_|\_\___/\__\___/_| |_\___/\_,_/__/  _ _ 
  / __|___| |_| |_ ___ _ _ | |__  __ _| | |
 | (__/ _ \  _|  _/ _ \ ' \| '_ \/ _` | | |
  \___\___/\__|\__\___/_||_|_.__/\__,_|_|_|
                                           
]
  puts "Welcome to Tic Tac Toe!"
  puts "Please select type of game:"
  puts "Enter 0   Computer vs Computer Game"
  puts "Enter 1   Player vs Computer Game"
  puts "Enter 2   2 Player Game"
   input = gets.chomp
     case input
      when "0"
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
      when "1"
        puts "Do you want to be 'X' and Go First? (y/n)"
        first_move = gets.chomp.downcase
        if first_move == "y"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        elsif first_move == "n"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        else
          puts "Please enter y or n..."
          start
        end
      when '2'
        Game.new.play
      else
        puts "Invalid input"
        puts "Please enter 0, 1 or 2"
        start
    end
     start if play_again?
end
 def play_again?
  puts "Do you want to play again? (y/n)"
  input = gets.chomp.downcase
   if input == "y"
    start
  elsif input == "n"
    puts "See you Later!"
  else
    puts "Please enter y or n"
    puts
    play_again?
  end
end
 start
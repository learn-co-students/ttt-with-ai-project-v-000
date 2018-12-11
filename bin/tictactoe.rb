#!/usr/bin/env ruby

require_relative '../config/environment'

def game_start
  puts "Welcome to Command Line Tic Tac Toe!"
  puts "Please choose player mode:"
  puts "0 - Computer VS Computer"
  puts "1 - You VS Computer"
  puts "2 - You VS a friend"

  player_mode = gets.strip

  if player_mode == "1"
    puts "Do you want to go first? [y/ n]"
    if gets.strip == "y"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
    else   Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
    end

  elsif player_mode == "0"
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play

  elsif player_mode == "2"
    Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
  end
  puts "Would like to play again? [y/ n]"

end

game_start

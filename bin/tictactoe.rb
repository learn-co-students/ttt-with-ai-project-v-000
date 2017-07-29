#!/usr/bin/env ruby
require 'pry'
require_relative '../config/environment'

puts "Welcome to TicTacToe"
puts "Please select game mode
Enter 0 for Computer vs Computer
Enter 1 for Player vs Computer
enter 2 for Player vs Player"
input = gets.strip
if input == "0"
  puts "Computer vs Computer"
  game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
  game.play
  game.board.reset!

elsif input == "1"
  puts "Computer vs Player"
  puts "Do you want to be 'X' or 'O'?"
  token = gets.strip.upcase
  if token == "X"
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
  elsif
    game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
  elsif input == "2"
   puts "Player vs Player"
   game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
  end
  game.play
  game.board.reset!
end

while game.over?
  puts "Play Again?
  Y = yes
  N = no"
  input = gets.strip.upcase
  if input == "Y"
    game.play
  else input == "N"
    exit
  end
end

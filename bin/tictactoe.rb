#!/usr/bin/env ruby

require_relative '../config/environment'

def start
  puts "Welcome to Tic-Tac-Toe!"
  puts "Please enter the number of players: 0, 1, or 2."
  
  mode = gets.chomp
  
  case mode
    when "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    when "1"
      puts "Would you like to go first? (y/n)"
      if gets.strip == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), board.new).play
      else
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), board.new).play
    when "2"
      Game.new(Players::Comupter.new("X"), Players::Computer.new("O"), board.new).play
    else
      puts "Invalid entry. Game restarting..."
      self.start
    end
  end
end
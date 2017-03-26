#!/usr/bin/env ruby

require_relative '../config/environment'

class CLI

  def start
    puts "\n"
    puts "How many players?"
    @input = gets.strip.to_i
    if @input == 2
      @game = Game.new
    elsif @input == 1
      @game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    else
      puts "INVALID - Must be 1 or 2 players:"
      puts "\n"
      start
    end
  end

  def finish
    puts "Would you like to play again? (y/n)"
    @new_input = gets.strip
    if @new_input == "y"
      go
    elsif @new_input != "n" && @new_input != "y"
      finish
    end
  end

  def go
    self.start
    @game.play
    self.finish
  end

end

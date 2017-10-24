require_relative "../lib/board.rb"
require_relative "../lib/game.rb"
require_relative "../lib/player.rb"
require_relative "../lib/players/computer.rb"
require_relative "../lib/players/human.rb"


class TicTacToe

  def initialize
  end

  def call
    puts "Hello! Welcome to Tic-Tac-Toe"
    puts "Please choose an option "
    puts "0 player - Please type 0"
    puts "1 player - Please type 1"
    puts "2 players - Please type 2"

      input = gets.chomp
        if input == "0"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
        elsif
          input == "1"
          game = Game.new(player_1 = Players::Computer.new("X"))
        else
          game = Game.new
        end
          game.play
  end
#binding.pry
end

require 'pry'
require_relative '../game.rb'
require_relative '../board.rb'

class Player::Computer < Player

  def move(board)
    valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    valid_moves.sample
  end
end

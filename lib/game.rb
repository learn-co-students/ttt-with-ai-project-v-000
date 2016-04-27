require "pry"
require_relative "../config/environment.rb"

class Game

  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
  [0,4,8], # First Diagonal
  [6,4,2] #Second Diagonal
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def turn_count
    count = 0
    @board.cells.each {|position| count += 1 if position == "X" || position == "O"}
    count
  end

  def current_player
    counter = turn_count
    counter % 2 == 0 ? player_1 : player_2
  end

end

require 'pry'
class Game
  include Players
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row

    [0,3,6], #left horizontal column
    [1,4,7], #Middle horizontal column
    [2,5,8], #Right horizontal column

    [0,4,8], #left to bottom right diagonal
    [2,4,6] #right to bottom left diagonal
  ]
  attr_accessor :board,:player_1,:player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"),board = Board.new)
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
    @board = board if board
  end

  def current_player
     if board.turn_count.even?
       player_1
     else
       player_2
     end
  end

  def over?
    board.full?
  end
  def won?
    board
    binding.pry
  end



end

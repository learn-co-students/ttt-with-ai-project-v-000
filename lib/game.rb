require 'pry'
class Game 

attr_accessor :board, :player_1, :player_2, :timer 

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(board = Board.new, player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"))
    binding.pry 
    @Board = board 
    @player_1 = player_1
    @player_2 = player_2
 
  end 
 



end 


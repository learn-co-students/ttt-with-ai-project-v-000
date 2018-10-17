require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left row
  [1,4,7], # vertical middle row
  [2,5,8], # right row
  [0,4,8], # top left diag
  [2,4,6]  # top right diag
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    board.turn_count.odd? ? player_2 : player_1 
    #in order to get this to work I had to make player_2 the truthy for odd...maybe we can go over this later
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
        board.cells[win_combo[1]] == board.cells[win_combo[2]] && 
        board.taken?(win_combo[0]) 
        return win_combo
      end
    end
    false
  end 
#if the passed in board.cell array matches any of the WIN_COMBINATIONS during iteration, #won? will return the win_combo, else false
  
  def draw?
    !won? && board.full?
  end
  
end
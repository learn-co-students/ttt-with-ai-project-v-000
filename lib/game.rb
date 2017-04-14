require 'pry'
class Game

attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #center column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6], #left diagonal
]

  def initialize(board = @cells)
    @player_1 = Players::Human.new("X")
    @player_2 = Players::Human.new("O")
    @board = Board.new
    #binding.pry
  end

  def current_player
    if board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3]
        if position_1 == player_1 && position_2 == player_1 && position_3 == player_1
          return win_combination # return the win_combination indexes that won.
        elsif position_1 == player_2 && position_2 == player_2 && position_3 == player_2
          return win_combination
        else
      end
    end
  end

  def full?
    @board.none? {|index| index == " "}
  end

  def draw?
    if won? || !full?
      return false
    else
      return true
    end
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    elsif !full?
      return false
    end
  end
end

require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]]

  def initialize(p_1 = Human.new("X"), p_2 = Human.new("O"), board = Board.new)
    @player_1 = p_1
    @player_2 = p_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.board.full? ? true : false
  end

  def won? 
    WIN_COMBINATIONS.detect do |win_array|
      win_array.all?{|num| self.board.cells[num] == "X"} || win_array.all?{|num| self.board.cells[num] == "O"}
    end
  end

  def draw?
   !won? && over?
  end

  def winner
    
  end
end


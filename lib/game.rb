require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

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
    won? || draw?
  end

  def won? 
    WIN_COMBINATIONS.detect do |win_array|
############ Try to insert PROC?? ###########
      win_array.all?{|num| self.board.cells[num] == "X"} || win_array.all?{|num| self.board.cells[num] == "O"}
    end
  end

  def draw?
   !won? && self.board.full?
  end

  def winner
    if draw?
      nil
############ Try to insert PROC?? ###########
    elsif WIN_COMBINATIONS.detect{|win_array| win_array.all?{|num| self.board.cells[num] == "X"}}
      "X"
    elsif WIN_COMBINATIONS.detect{|win_array| win_array.all?{|num| self.board.cells[num] == "O"}}
      "O"
    end
  end

  def turn
    spot = current_player.move(@board)
    !board.valid_move?(spot) ? turn : board.update(spot, current_player)
  end

  def play
    until over?
      turn
      board.display
    end
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end


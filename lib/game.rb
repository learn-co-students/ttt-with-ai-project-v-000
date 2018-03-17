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
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end
  
  def over?
    winning = []
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]]  == "X" && @board.cells[combo[2]] == "X" 
        winning << combo
      elsif @board.cells[combo[0]] == "0" && @board.cells[combo[1]] == "0" && @board.cells[combo[2]] == "0"
        winning << combo
      end
    end
   winning.flatten != [] || @board.full? == true ? true : false
  # binding.pry
  end

  def won?
    winning = []
    WIN_COMBINATIONS.detect do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]]  == "X" && @board.cells[combo[2]] == "X" 
        winning << combo
      elsif @board.cells[combo[0]] == "0" && @board.cells[combo[1]] == "0" && @board.cells[combo[2]] == "0"
        winning << combo
      end
    end
    winning.flatten != [] && @board.full? == true ? winning.flatten : false
  end

end
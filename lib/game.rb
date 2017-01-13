require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[0]] == @board.cells[combo[2]]) &&
      @board.cells[combo[0]] != " "
    end
  end

  def draw?
    self.won? == false && @board.full? == true
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      if @board.cells.count("X") <= @board.cells.count("O")
        "O"
      else
        "X"
      end
    else
      nil
    end
  end

  def turn
    
  end


end

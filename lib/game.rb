require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
  end

  def play
    #until over?
    #end
  end

  def turn
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      if !won && win.all? {|cell| board.cells[cell] == "X"} || win.all? {|cell| board.cells[cell] == "O"}
        won = win
      end
    end
    won
  end

  def winner
  end

  def over?
    self.draw? || self.won?
  end

  def draw?
    board.full? && !self.won?
  end

end

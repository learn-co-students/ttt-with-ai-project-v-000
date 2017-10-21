require 'pry'

class Game

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top Row
    [3, 4, 5], # Middle Row
    [6, 7, 8], # Bottom Row
    [0, 3, 6], # First Column
    [1, 4, 7], # Second Column
    [2, 5, 8], # Third Column
    [0, 4, 8], # Top Left Diagonal
    [2, 4, 6] # Top Right Diagonal
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      combination.all?{|i| board.cells[i] == "X"} || combination.all?{|i| board.cells[i] == "O"}
    end
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      board.update(input, self.current_player)
      self.board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end

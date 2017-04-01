require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[1]] == self.board.cells[win[2]] && (self.board.cells[win[0]] == "X" || self.board.cells[win[0]] == "O")
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.won? ? self.board.cells[self.won?[0]] : nil
  end

  def turn
    move = current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, current_player)
      self.board.display
    else
      self.turn
    end
  end

  def play
    self.turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end      
  end
end

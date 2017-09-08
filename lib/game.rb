require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  #def start
  #end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    end
    if self.draw?
      puts "Cat's Game!"
    end
  end

  def turn
    move = self.current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
    else
      self.turn
    end
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      if !won && win.all? {|cell| self.board.cells[cell] == "X"} || win.all? {|cell| self.board.cells[cell] == "O"}
        won = win
      end
    end
    won
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def over?
    self.draw? || self.won?
  end

  def draw?
    self.board.full? && !self.won?
  end

end

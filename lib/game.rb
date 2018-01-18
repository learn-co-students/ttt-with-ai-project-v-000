require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Second column
    [2,5,8], # Last column
    [0,4,8], #\
    [2,4,6]  #/
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[0]] != " "
    end
  end

  def winner
    if won = self.won?
      self.board.cells[won[0]]
    end
  end

  def turn
    player = self.current_player
    current_move = player.move(self.board)
    if !self.board.valid_move?(current_move)
      self.turn
    else
      self.board.update(current_move, player)
      puts "#{player.token} played at position #{current_move}."
      self.board.display
    end
  end

  def play
    while !self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end

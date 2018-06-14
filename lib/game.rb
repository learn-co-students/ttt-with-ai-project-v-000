require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left diagonal
    [6,4,2] # right diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[0]] != " "
      # Why doesn't this work with: self.board.taken?(board.cells[combo[0]]) instead of self.board.cells[combo[0]] != " "? Something is wrong with #taken?
        combo
      end
    end
  end

  def draw?
    !self.won? && board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    # How does this know to move to player 2?
    input = current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
    else
      puts "Your move was not valid. Try again!"
      self.turn
    end
    self.board.display
  end

  def play
    # Tried using while self.board.turn_count < 9, but didn't work. Gave error that I don't understand:
      # Failure/Error: game.play
        # Errno::ENOENT:
        # No such file or directory @ rb_sysopen - documentation
    while !self.over?
      self.turn
    end

    if self.won?
      puts "Congratulations #{winner}!"
    end

    if self.draw?
      puts "Cat's Game!"
    end
  end

end

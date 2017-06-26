require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], # Diagonal left to right
    [2,4,6]  # Diagonal right to left
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.player_1.token == 'X'
      self.board.turn_count % 2 == 0 ? player_1 : player_2
    else
       self.board.turn_count % 2 == 1 ? player_1 : player_2
     end
  end

  def full?
    !self.board.cells.include?(" ")
  end

  def over?
    self.full? || self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      pos_1 = self.board.cells[win_index_1]
      pos_2 = self.board.cells[win_index_2]
      pos_3 = self.board.cells[win_index_3]

      (pos_1 == player_1.token &&  pos_2 == player_1.token &&  pos_3 == player_1.token) ||
      (pos_1 == player_2.token &&  pos_2 == player_2.token &&  pos_3 == player_2.token)
      end
  end

  def draw?
    self.full? && !self.won?
  end

  def winner
      if self.won?
        pos = self.won?.first
        winning_token = self.board.cells[pos]
        winning_token == 'X' ? 'X' : 'O'
      else
        nil
      end
  end

  def turn
    pos = self.current_player.move(self.board.cells)
    if self.board.valid_move?(pos)
      self.board.update(pos, current_player)
    else
      "That move is not valid! Please choose again."
      pos = self.current_player.move(self.board.cells)
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end

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
    if board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    self.draw? || self.won?
  end

  def draw?
    !self.won? && self.board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |wc|
    self.board.cells[wc[0]] == self.board.cells[wc[1]] && self.board.cells[wc[1]] == self.board.cells[wc[2]] && self.board.taken?(wc[0] + 1)
    end
  end

  def winner #need to fix, won't return nil if false
     if won?
      wc = won?
      self.board.cells[wc[0]]
    else
       nil
    end
 end


 def turn
     user_input = self.current_player.move(board)
     if self.board.valid_move?(user_input)
       self.board.update(user_input, current_player)
       self.board.display
     elsif !self.board.valid_move?(user_input)
       puts "Invalid move"
       turn
     end
 end

 def play
   while !over?
     turn
     end
     board.display
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
     end
   end
 end

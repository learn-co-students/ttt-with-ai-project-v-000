require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =
  [[0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  #  def initialize(player_1, player_2, board)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

   def current_player
     board.turn_count.even? ? @player_1 : @player_2
   end

   def draw?
     board.full? && !won?
   end

   def won?
     WIN_COMBINATIONS.detect do |combo|
       @board.cells[combo[0]] == @board.cells[combo[1]] &&
       @board.cells[combo[1]] == @board.cells[combo[2]] &&
       @board.taken?(combo[1] + 1)
     end
   end

   def over?
     draw? || won?
   end

   def winner
     won? ? @board.cells[won?[0]] : nil
   end

   def turn
     pos = current_player.move(board)
     until board.valid_move?(pos)
       pos = current_player.move(board)
     end
     board.update(pos, current_player)
   end

   def play
     until over?
       turn
     end
     if won?
      #  binding.pry
       puts "Congratulations #{winner}!"
     else
       puts "Cat's Game!"
     end
     
   end
end

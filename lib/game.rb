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
     [2,4,6],
   ]
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
   end

   def current_player
     if self.board.turn_count % 2 == 0
       self.player_1
     else
       self.player_2
     end
   end

   def over?
     self.won? || self.draw?
   end

   def draw?
     !won? && @board.full?
   end

   def won?
     WIN_COMBINATIONS.detect do |combo|
         @board.cells[combo[0]] == @board.cells[combo[1]] &&
         @board.cells[combo[1]] == @board.cells[combo[2]] &&
         @board.taken?(combo[0]+1)
       end
   end

   def winner
     won? ? @board.cells[won?[0]] : nil
   end

   def turn
     input = self.current_player.move(@board)
     if self.board.valid_move?(input)
       self.board.update(input, self.current_player)
     else
       turn
     end
   end


   def play
       while !over?
         turn
       end
       if won?
         puts "Congratulations #{winner}!"
       elsif draw?
         puts "Cat's Game!"
       end
     end


 end

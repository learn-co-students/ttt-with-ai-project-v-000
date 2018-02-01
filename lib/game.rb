require 'pry'
class Game
   attr_accessor :board, :player_1, :player_2
   WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
   end

   def current_player
      @board.turn_count.even? ? @player_1 : @player_2 
   end

   def over?
      won? || draw?
   end

   def won?
      WIN_COMBINATIONS.find do |combo|
         # if 
            @board.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
         #   return combo
         # end
       end

   end

   def draw?
      @board.full? && !won?
   end

   def winner
      if winning_combo = won?
         @board.cells[winning_combo[0]]
       end
   end

   #look here for potential bug
   def turn
      player = current_player
      res = player.move(@board)
      if @board.valid_move?(res)
         @board.update(res, player)
         current_player
      else
         turn
      end
    end

    def play
      # turn while !over?
      while !over?
         # binding.pry
         turn
      end
      if won?
         puts "Congratulations #{winner}!"
      elsif draw?
         puts "Cat's Game!"
      end

    end
end
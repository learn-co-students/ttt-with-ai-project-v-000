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
            @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
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

   def turn
      player = current_player
      res = player.move(@board)
      if @board.valid_move?(res)
         @board.update(res, player)
         current_player
      else
         puts "Invalid move! Try again, #{current_player.token}."
         turn
      end
   end
   
   def play

      while !over?
         puts "It's your move, #{current_player.token}!"
         turn
         puts "#{@board.display}"
      end
      if draw?
         puts "Cat's Game!"
         @board.reset!
      elsif won?
         puts "Congratulations #{winner}!"
         @board.reset!
      end

    end

    
   #  def endGame
   #    puts "Would you like to play again? (y or n)"
   #    answer = gets.chomp
   #    if answer == "y"
   #       start
   #    elsif answer == "n"
   #       puts "Thanks for playing!"
   #    elsif answer != "y" || answer != "n"
   #       puts "Please enter y or n"
   #       endGame
   #    end
   # end
   
#    def start
#      play
#      endGame
#   end

end
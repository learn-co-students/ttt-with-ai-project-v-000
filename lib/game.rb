require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
end
def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_2
end

def over?
  draw? || won?
end

def won?
  WIN_COMBINATIONS.detect do |combo|		
       @board.cells[combo[0]] == @board.cells[combo[1]] &&		
       @board.cells[combo[1]] == @board.cells[combo[2]] &&		
       @board.taken?(combo[0]+1)	
  end	
end

     def draw?
       @board.full? && !won?
     end

     def winner       
         if winning_combo = won?
           @winner = @board.cells[winning_combo[0]]
         end
     end

     def turn 
       player = current_player	
      	#<Players::Human:0x000000020bfde0>
      #  #def move(board)
      #    puts "Please Enter a move from 1 to 9"
      #    input = gets.chomp
      #  end
    current_move = player.move(@board)
    # will get output from user for example 2	
    # def valid_move?(pos)
    #   !taken?(pos) && pos.to_i.between?(1,9)
    # end
	
    if (!@board.valid_move?(current_move))	#will return true for a valid position , i
      turn	
    else		
      puts "Turn: #{@board.turn_count}\n"		
      @board.display		
      @board.update(current_move, player)		
      puts "#{player.token} moved #{current_move}"		
      @board.display		
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
    ##############################
end

class Game 
  
  include Players
  
  attr_accessor :board, :player_1, :player_2, :token
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [2, 5, 8], [1, 4, 7],
    [0, 4, 8], [2, 4, 6]
    ]
    
   def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end
   
   def current_player
     if @board.turn_count.even?
       @player_1
     else
       @player_2
     end 
   end
   
   def over?
     self.won? || self.draw?
   end 
   
   def won?
    WIN_COMBINATIONS.any? do |combo|
      if @board.taken?(combo[0]+1) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
        return combo
      else 
        false
      end
    end
  end
   
   def draw?
     !won? && @board.full?
   end
   
   def winner
     if won? == FALSE
       return nil
     else 
       combo = won?
       @board.cells[combo[0]]
     end
   end
   
   def turn
     puts "Please enter a number (1-9):"
     move = current_player.move(board)
     if @board.valid_move?(move)
       @board.update(move, current_player)
     else
       turn
     end 
   end
     
    def play 
      turn until over?
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
    end 
     
   
end 
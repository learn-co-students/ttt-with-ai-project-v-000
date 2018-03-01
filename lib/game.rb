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
     player = current_player
     move = current_player.move(@board)
     if !@board.valid_move?(move)
       puts "Invalid move! Please enter a number 1-9:"
       turn
     else
       puts "Turn = #{@board.turn_count+1}"
       @board.display
       puts "Player #{current_player.token} moved to #{move}"
       @board.update(move, player)
       @board.display
       puts "Player #{current_player.token}, please enter a number 1-9:"
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
    
   def start 
     puts "Would you like to play with 0, 1, or 2 players?"
     input = gets.strip 
     if input == "0" 
       zero_player
     elsif input == "1" 
       one_player
     elsif input == "2" 
       two_player
     else 
       start 
     end
   end
   
   def zero_player
     game = Game.new(Computer.new("X"), Computer.new("O"), Board.new)
     game.play
     play_again
   end  
   
   def one_player
     puts "Who should go first, computer or human?"
     input = gets.strip
     if input == "human"
       puts "Please enter a number 1-9:"
       game = Game.new(Human.new("X"), Computer.new("O"), Board.new)
       game.play
       play_again
     elsif input == "computer"
       game = Game.new(Computer.new("X"), Human.new("O"), Board.new)
       game.play
       play_again
     else
       one_player 
     end
   end
   
   def two_player
      puts "Please enter a number 1-9:"
     game = Game.new(Human.new("X"), Human.new("O"), Board.new)
     game.play 
     play_again
   end
   
   def play_again
     puts "Would you like to play again? yes or no"
       input = gets.strip
       if input == "yes"
         start
       elsif input == "no"
         puts "So long and thanks for all the fish."
       else
         puts "Sorry, I didn't hear that!"
         play_again
       end
     end
       
end 
class Game
   attr_reader :board, :player_1, :player_2
   
   WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]] #defines all of the possible combinations to win
   
   def board=(board) #defines the board for a game, but is currenlty using the Board class, I think this is wrong
      @board=[] #i would like to define with a new board class, but that results in an @cells with 9 " " spots and not []
   end
  
   def player_1=(player_1) #player_1 and player_2 both are defined, but are not yet descripted
      @player_1=player_1
   end
   
   def player_2=(player_2)
      @player_2=player_2
   end
  
   def initialize (player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new) #initializes with two human players and a new game board instance 
      @player_1=player_1
      @player_2=player_2
      @board=board
   end
   
   def current_player #determines the current player using turn count from the Board class
      if board.turn_count%2==0
         return player_1
      else
         return player_2
      end
   end
   
   def over? #checks if there are any openings on the board
      if !board.full?
         return false
      elsif won?
         return true #uses the won method to add to the over method
      else
         return true
      end
   end
  
   def won? #determines if one of the WIN_COMBINATIONS has been completed
      WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]]=="X" &&  board.cells[win_combo[1]]=="X" &&  board.cells[win_combo[2]]=="X" 
         return true
      elsif board.cells[win_combo[0]]=="O" &&  board.cells[win_combo[1]]=="O" &&  board.cells[win_combo[2]]=="O"
         return true
      end
                        end
      return false
   end
   
   def draw? #uses over? and won? methods to determine a draw game
      if board.full?
         if won?
            return false
         else
            puts "Cats Game!" 
            return true
         end
      else
         return false
      end
   end
   
   def winner
     WIN_COMBINATIONS.each do |win_combo| #uses the main part of the won? method but a different return value
      if board.cells[win_combo[0]]=="X" &&  board.cells[win_combo[1]]=="X" &&  board.cells[win_combo[2]]=="X" 
         puts "Congratulations X!" 
         return "X"
      elsif board.cells[win_combo[0]]=="O" &&  board.cells[win_combo[1]]=="O" &&  board.cells[win_combo[2]]=="O"
         puts "Congratulations O!" 
         return "O"
      end
                        end
      return nil #return nil if neither X or O have won
   end
   
   def turn 
      player=current_player #sets the player using the current_player method
      response=player.move(board) #uses the move method from the Human class
      if !board.valid_move?(response) #uses the valid_move? method from the board class
         turn
      end
      board.update(response, player) #updates the board using the board class
      player=current_player #updates the current player
   end
   
   def play #the play method
     until over? #checks with an until loop for if the game is over
      if won?    #checks if the game has been won or is a draw before the turn
         return winner
      elsif draw?
         return draw?
      end
      turn #is the players turn
      board.display
      if won?   #again checks if the game has been won or is a draw
         return winner
      elsif draw?
         return draw?
      end
     end
     if won? #is a catch for if the until loop says the game is over before entering the loop, these will declare the winner or a draw   
         return winner
     elsif draw?
         return draw?
     end
   end
   
   
  
 
end
module Players 
  class Human < Player 
    
   def move(board) 
     puts" Welcome to TicTacToe."
     puts "Please make your move." 
     move = gets.strip
   end 
   #gets.strip
  end 
  
end 

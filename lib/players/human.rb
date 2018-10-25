module Players 
  class Human < Player 
    
   def move(board) 
     puts" Welcome to TicTacToe."
     puts "Please make your first move." 
     move = gets.strip
   end 
   #gets.strip
  end 
  
end 

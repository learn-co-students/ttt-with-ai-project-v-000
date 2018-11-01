require 'pry'
module Players 
  class Human < Player 
    
    def move(board) 
      puts" Welcome to TicTacToe."
      puts "Please make your move. Enter 1-9." 
      move = gets.strip
    end 
  end
end 

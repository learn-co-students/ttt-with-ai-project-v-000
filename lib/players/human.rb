module Players
  class Human < Player
   
    #def move(board)
    #  input = gets.strip 
    #  input
    #end 
  
  
    def move(board)
      puts "Choose a space on the board, 1-9"
      gets.strip
    end 
  end 
end 

#move asks for input?
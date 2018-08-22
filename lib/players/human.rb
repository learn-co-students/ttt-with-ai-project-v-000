module Players

  class Human < Player
    
    def move(board)
      puts "Please enter where you would like to put your token:"
      input = gets.strip
      input
    end
    
  end
end 
  

module Players
  
  class Human < Player
    
    def move(board)
      puts "Play your move!"
      input = gets.strip
      input
    end
    
  end
      
end

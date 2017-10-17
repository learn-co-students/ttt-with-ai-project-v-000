module Players
  class Players::Human < Player
    
    def move(board)
      puts "Enter your move, #{self.token}"
      input = gets.strip

    end 
  
  end
end 
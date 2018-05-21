module Players
  
  class Human < Player
    
    def move(board)
     puts "Player '#{self.token}' Please enter 1-9"
     num = gets
     num
    end 
  end  
  
end 
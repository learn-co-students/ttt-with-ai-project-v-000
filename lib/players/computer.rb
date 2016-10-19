module Players
  
  class Computer < Player
    
    def move(board)
      # puts "Enter a position from 1 to 9:"
      rand(1..9).to_s
    end
    

  end 
  
end
class Players
  
  class Human < Player
   def move(board)
    puts "Please pick a number from 1 - 9:"
     input = gets.strip
     @input = input
    end
  end
    
end


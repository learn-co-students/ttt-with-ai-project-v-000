module Players
  
  class Human < Player
    
    def move(board)
      puts "Please type a number from 1-9 to select your token for the game:"
      u_input = gets.strip
    end
  
  end
  
end
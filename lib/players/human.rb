module Players
  class Human < Player
    
    def move(board)
      puts "Your turn, #{token}. Where would you like to go?"
      input = gets.strip
      input
    end
    
  end
end
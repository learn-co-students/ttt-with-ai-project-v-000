module Players
  class Human < Player
    
    def move(board)
      puts "Which cell would you like to pick?"
      input = gets.strip
    end
    
  end
end

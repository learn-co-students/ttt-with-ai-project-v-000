module Players
  class Human < Player
  
    def move(board)
      puts "You're up! Where would you like to move?"
      puts "  Please pick a valid position from 1-9."
      gets.strip
    end
  
  end
end
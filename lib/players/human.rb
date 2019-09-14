module Players
  class Human < Player
    def move(board)
      puts "To make a move, please enter a number 1-9."
      #returns the player's move
      gets.strip
    end
  end
end

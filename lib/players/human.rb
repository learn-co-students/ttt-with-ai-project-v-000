module Players
  class Human < Player
    def move(board)
      #takes in a board argument and allows a human player to enter a move via the CLI.
      #return the value the user enters.
      puts "please enter 1-9:"
      input = gets.strip
    end
  end
end

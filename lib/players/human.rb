module Players
  class Human < Player

#The human player must implement a #move method that takes in a board argument and allows a human player to enter a move via the CLI.
#The method should return the value the user enters.
# Even though the method accepts a board argument, it does not need to use it.

    def move(board)
      input = gets.strip
    end
  end
end

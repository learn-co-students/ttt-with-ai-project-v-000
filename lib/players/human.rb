module Players
  class Human < Player

    # Takes in a board argument and allows a human player to enter a move
    # via the CLI. Returns the value the user enters.
    def move(board)
      puts "Where would you like to move? (1-9) Your token is #{self.token}."
      input = gets.strip
    end
  end
end

module Players
  class Human < Player
    # a move method that takes in a board argument and allows a human player to enter a move via the CLI
    def move(array)
      return gets
    end
  end
end

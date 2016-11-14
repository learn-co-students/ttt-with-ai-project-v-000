module Players
  # Inherits from Player.
  class Human < Player

    # Asks the user for input and returns it.
    def move(board)
      print "Where would you like to move (1-9)? "
      move_input = gets.chomp
      move_input
    end

  end

end

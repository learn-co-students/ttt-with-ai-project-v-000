module Players
  class Human < Player
    # Inherits initialize from the Player class.

    def move(board)
      # "Gets" a move from the player when the turn method is called in the Game class.
      command = gets.strip
      command
    end

  end
end

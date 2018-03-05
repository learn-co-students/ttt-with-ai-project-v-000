module Players

  class Human < Player

    def move(board)
      "Please enter a board position, 1-9, to play:"
      gets.strip
    end
  end
end

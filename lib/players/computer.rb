module Players
  class Computer < Player
    # a move method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string
    def move(board)
      return rand(1...10).to_s
    end
  end
end

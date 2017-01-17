module Players
  class Players::Computer < Player   # represents a computer player of Tic Tac Toe. Implement a #move method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string.

    def move(board)
      move = nil
      input = (1..9).to_a.sample
      input.to_s
    end
end

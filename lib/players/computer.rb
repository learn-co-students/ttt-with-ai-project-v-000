require 'pry'

#complete as of 3/18/2019
#needs to have ai updated so not be so random and stupid


module Players
  class Computer < Player

    WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [2,4,6]
     ]

    def move(board)

      #rudimentary random selection to pass tests
      #moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      #moves[rand(0..8)]

      #winning logic: pick open corners and sides, only pick a space if it is part of a possible winning combination
      #must check turn count. first turn dictates a different strategy than second turn
      #if going second always take center if open

      #passing but not great ai
      corners = [1, 3, 7, 9]
      sides = [2, 4, 6, 8]

      if board.turn_count == 0
        corners[rand(corners.length)].to_s
      elsif board.valid_move?(5)
        "5"
      elsif board.turn_count == 1 && board.taken(5)
        corners[rand(corners.length)].to_s
      else
        emptyIndices = board.cells.select { |square| square == " " }
        emptySquares = emptyIndices.map { |i| i.to_i + 1}
        emptySquares[rand(emptySquares.length)].to_s
      end

    end
  end
end

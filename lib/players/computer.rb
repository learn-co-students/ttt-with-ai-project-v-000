module Players

  class Computer < Player

    attr_accessor :board

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        if board.cells[4] == " "
          valid_moves = "5"
        elsif
          corner_moves = ["1", "3", "7", "9"]
          corner_moves.sample
        else
          valid_moves.sample
      end
    end

  end
end

# Computer logic
# turn 1
#   - if available go to the middle - board.cells[4]
#   - otherwise go to one of the corners - board.cells[0] or board.cells[2] or board.cells[6] or board.cells[8]
# other turn
#   -  go to any available position
#

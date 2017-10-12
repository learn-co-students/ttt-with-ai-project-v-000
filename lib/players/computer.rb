module Players

  class Computer < Player

    attr_accessor :board

    def move(board)
        if board.cells[4] == " "
          return "5"
        # Corner moves
        elsif board.cells[0] == " "
          return "1"
        elsif board.cells[2] == " "
          return "3"
        elsif board.cells[6] == " "
          return "7"
        elsif board.cells[8] == " "
          return "9"
        # Side moves
        else
          valid_moves = ["2", "4", "6", "8"]
          return valid_moves.sample
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

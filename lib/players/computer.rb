
  class Player::Computer < Player

attr_accessor :valid_moves, :board

    def move(board)
      @board = board
      @valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = best_move

      return computer_move
    end

    def best_move
      if board.turn_count == 0
        return "5"
      elsif board.turn_count == 1 && board.cells[5] == " "
        return "5"
      elsif board.turn_count == 1
        corner_move = corner
        return corner_move
      elsif
        valid_move = @valid_moves.sample
        return valid_move
      end
    end

    def corner
      if board.cells[1] == " "
        return "1"
      elsif board.cells[3] == " "
        return "3"
      elsif board.cells[7] == " "
        return "7"
      elsif board.cells[9] == " "
        return "9"
      end
    end

  end

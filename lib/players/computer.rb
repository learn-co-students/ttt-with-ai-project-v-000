module Players
  class Computer < Player

    def move(board)
      # helper methods: offensive(board), defensive(board), middle?(board),  corners?(board), sides?(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      if middle?(board)
        valid_moves[4]
      elsif upper_left_corner?(board)
        board[0] = self.token
      elsif upper_right_corner?(board)
        board[2] = self.token
      elsif lower_left_corner(board)
        board[6] = self.token
      elsif lower_right_corner(board)
        board[8] = self.token
      elsif left_side?(board)
        board[3] = self.token
      elsif right_side?(board)
        right_side?(board)
      else
        valid_moves.sample
      end
    end

    ## create helper methods ##
    def middle?(board)
      board.cells[4] == " "
    end

    def upper_left_corner?(board)
      board.cells[0] == " "
    end

    def upper_right_corner?(board)
      board.cells[2] == " "
    end

    def lower_left_corner?(board)
      board.cells[6] == " "
    end

    def lower_right_corner?(board)
      board.cells[8] == " "
    end

    def left_side?(board)
      if board.cells[3] == " "
        "3"
      end 
    end

    def right_side?(board)
      if !board.taken?("6")
        "6"
      end
    end

  end
end

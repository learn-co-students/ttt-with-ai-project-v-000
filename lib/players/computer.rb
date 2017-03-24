module Players

  class Computer < Player

    def move(board)
      if board[4] == " "
        "5"
      else
        move_cell = board.detect {|cell| cell == " "}
        "#{board.find_index(move_cell).to_i + 1}"
      end
    end

  end

end
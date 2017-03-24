module Players
  class Computer < Player

    def move(board = [])
      if board.cells[4] == " "
        "5"
      else
        move_cell = board.cells.detect {|cell| cell == " "}
        "#{board.cells.find_index(move_cell) + 1}"
      end
    end

  end
end

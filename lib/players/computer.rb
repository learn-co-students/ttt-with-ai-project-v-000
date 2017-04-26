module Players
  class Computer < Player
    attr_accessor :board, :cells

    def move(board)
      first_move
    end

    def first_move
      if board.cells[0] == " " && board.cells[4] == " "
        "1"
      else board.cells[4] == "0"
        "5"
      end
    end


  end
end

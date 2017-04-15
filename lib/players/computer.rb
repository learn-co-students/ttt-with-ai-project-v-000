module Players
  class Computer < Player
    def move(board)
      if board.cells[4] == " "
        "5"
      #does it match any winning combos?
      #elsif
      else
        (board.valid_cells.sample+1).to_s
      end
    end
  end
end

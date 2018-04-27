module Players
  class Computer < Player

    def move(board)
      
     opening = board.cells.index(" ") + 1
    if board.valid_move?(opening) == true
      return opening.to_s
    end
  end

  end
end

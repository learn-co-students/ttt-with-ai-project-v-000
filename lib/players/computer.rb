module Players

  class Computer < Player

    def move(board)
      if board.valid_move?
        return board.position
      end
    end

  end

end

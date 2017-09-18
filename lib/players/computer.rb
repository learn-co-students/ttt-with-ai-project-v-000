module Players
  class Computer < Player

    def move(board)
      i = 0
      while i < 9
        if board.valid_move?(i)
          return i.to_s
        else
          i += 1
        end
      end
    end
  end
end

module Players
  class Computer < Player

    def move(board)
      i = 0
      until board.valid_move?(i)
        i += 1
      end
      i.to_s

    end


  end
end

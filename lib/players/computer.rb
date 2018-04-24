module Players
  class Computer < Player

    def move(board)
      pos = (rand(9) + 1).to_s
      until board.valid_move?(pos)
        pos = (rand(9) + 1).to_s
      end
      pos
    end
  end
end

module Players
  class Computer < Player

    def move(board)
      position = Random.rand(9).to_s
      !board.valid_move?(position) ? position = Random.rand(9) : position
    end
  end
end

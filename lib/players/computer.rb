module Players
  class Computer < Player
    def move(board)
      pos = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
      if board.valid_move?(pos)
        pos.to_s
      else
        move(board)
      end
    end
  end
end
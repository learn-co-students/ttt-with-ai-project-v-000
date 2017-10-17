module Players
  class Computer < Player
    def move(board)
      pos = ''
      if !board.taken?(5)
        pos = "5"
      elsif board.turn_count == 1
        pos = "1"
      else
        pos = [1, 2, 3, 4, 5, 6, 7, 8, 9].sample
      end

      if board.valid_move?(pos)
        pos.to_s
      else
        move(board)
      end
    end
  end
end
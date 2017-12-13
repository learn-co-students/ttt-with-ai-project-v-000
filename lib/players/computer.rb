class Players

  class Computer < Player

    def move(board)
      valid_moves = []
      count = 1
      while !board.taken?(count) && count < 10
        valid_moves << count.to_s
        count += 1
      end
      if valid_moves.include?"5"
        "5"
      else
        valid_moves[0]
      end
    end

  end
end

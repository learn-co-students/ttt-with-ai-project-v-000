module Players
  class Computer < Player

    def move(board)
      if board.valid_move?(index=rand(1..9))
        index.to_s
      else
        nil
      end

    end

  end
end

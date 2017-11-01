module Players
  class Computer < Player

    def move(board)
      next_move = (((rand*8).round)+1).to_s
      while !board.valid_move?(next_move)
        next_move = (((rand*8).round)+1).to_s
      end
      next_move
    end

  end
end

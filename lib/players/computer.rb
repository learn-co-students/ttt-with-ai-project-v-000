module Players
  class Computer < Player
    def move(board)
      move = Random.rand(9).to_s;
      if board.valid_move?(move)
        return move
      else
        move(board)
      end
    end
  end
end

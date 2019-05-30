module Players
  class Computer < Player
    def move(board)
      move = rand(1..9).to_s
      if board.valid_move?(move)
        move
      else
        move(board)
      end
    end
  end
end

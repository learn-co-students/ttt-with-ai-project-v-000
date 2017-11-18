module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      next_move = valid_moves.sample
      if board.valid_move?(next_move)
        sleep(3)
        puts next_move
        next_move
      else
        move(board)
      end
    end
  end
end

module Players
  class Computer < Player
    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      move = valid_moves.sample
      if board.valid_move?(move)
        move
      end
    end
    
  end
end

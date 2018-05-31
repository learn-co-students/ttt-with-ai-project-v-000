module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.detect{|move|board.valid_move?(move)}
    end
  end
  
end

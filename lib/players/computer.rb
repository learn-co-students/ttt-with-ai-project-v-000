module Players
  
  class Computer < Player
    
    def move(board)
      valid_moves = ["5","1","9","2","8","3","7","4","6"]
      valid_moves.shuffle!
      valid_moves.detect{|move| board.valid_move?(move)}
    end
    
  end
  
end
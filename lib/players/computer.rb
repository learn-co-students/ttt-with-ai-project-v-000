module Players
  class Computer < Player
    
    def move(board)
      find_first_valid_move(board)
    end
    
    private
    
    def find_first_valid_move(board)
      all_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      all_moves.find { |m| board.valid_move?(m) }
    end
    
  end
end
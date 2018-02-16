module Players
  class Computer < Player
    def move(board)
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].select{|move| board.valid_move?(move)}.sample #whee
    end
  end
end

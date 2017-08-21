module Players
  class Computer < Player
    def move(board)
    	["1", "2", "3", "4", "5", "6", "7", "8", "9"].select {|position| board.valid_move?(position)}.sample
    end
  end
end
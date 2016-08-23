#module Players
  class Players::Computer < Player
    def move(board)
      board.cells
      move_array = ["1","5","2","4","7","3","8","9","6"]
      move_array.detect {|position| board.valid_move?(position)}
    end
  end
end

module Players
  class Computer < Player
    attr_accessor :board
    
    def move(board)
      @board = board
      if middle
        input = 5
      elsif corners
        input = corners + 1
      else
        input = non_corners + 1
      end
      input.to_s
    end
    
    def middle
      board.cells[4] == " " || board.cells[4] == ""
    end
    
    CORNER = [0, 2, 6, 8]
    NON_CORNER = [1, 3, 5, 7]
    
    def corners
      CORNER.find {|i| @board.cells[i] == " " || @board.cells[i] == ""}
    end
    
    def non_corners
      NON_CORNER.find {|i| @board.cells[i] == " " || @board.cells[i] == ""}
    end
    
  end
end
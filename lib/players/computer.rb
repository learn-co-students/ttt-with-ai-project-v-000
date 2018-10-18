require "pry"
module Players

  class Computer < Player

  # 0-indexed arrays
  CORNERS = [0,2,6,8] # probably belongs in Game or Board, technically
  MIDDLE = 4


    def move(board) # => 1-indexed board position
      "#{integer_move(board)+1}"
    end # end #move(board)

    def integer_move(board) # => 0-based board index
      if !board.taken?(MIDDLE) # move in the middle if middle is free
        MIDDLE
      elsif free_corner = CORNERS.find { |corner| !board.taken?(corner) }
        free_corner
      elsif target_combo = board.WIN_COMBINATIONS.find { |combo| combo.select {|token| token = "O" }.count = 2 }
        target_combo.find { |spot| !spot.taken? }
      else
        1
      end # end if
    end # end integer_move(board)
  end # end class

end # end module

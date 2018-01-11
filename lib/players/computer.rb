require 'pry'

module Players

  class Computer < Player

    def move(board)
      i = board.cells.find_index {|cell| cell == " "}
      (i + 1).to_s
    end

  end
end

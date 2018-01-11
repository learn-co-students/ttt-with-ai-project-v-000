require 'pry'

module Players

  class Computer < Player

    def move(board)
      i = board.find_index {|cell| cell == " "}
      (i + 1)
    end
  end
end

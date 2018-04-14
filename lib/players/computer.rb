require 'pry'
module Players

  class Computer < Player
    # WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [2,4,6]]

    def move(board)
      binding.pry
    end

    def winnable
      if self.token == "X"
        other = "O"
      else
        other = "X"
      end
        a = board.cells.each_index.find {|i| board.cells[i] == "O"}
        WIN_COMBINATIONS.reject {|combo| combo.include?(a)}
    end

  end
end

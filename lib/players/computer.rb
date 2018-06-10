require 'pry'
module Players
  class Computer < Player
    attr_accessor :opp_token, :move_arr

    def initialize(token)
      super
      @move_arr = move_arr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    end
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    def block(board)
      oh_shit = WIN_COMBINATIONS.detect do |win|
        win.select{ |i| board.cells[i] == opp_token }.count == 2
      end
      oh_shit
    end

    def kill_strike(board)
      oh_shit = WIN_COMBINATIONS.detect do |win|
        win.select{ |i| board.cells[i] == self.token }.count == 2
      end
      oh_shit
    end

    def move(board)
      corners = ["1", "3", "7", "9"]
      edges = ["2", "4", "6", "8"]
      center = "5"
      if self.token == "X"
        if board.cells.all?{ |i| i == " " }
         "1"
        elsif board.turn_count == 2 && board.position(5) == "O"
         "9"
        elsif board.turn_count == 2 && corners.any?{ |i| board.position(i) == "O"}
         corners.sample
        elsif board.turn_count == 2 && edges.any?{ |i| board.position(i) == "O"}
         "5"
        elsif board.cells.values_at(0, 2, 6, 8).any?{ |i| i == " " }
          corners.sample
        elsif board.cells.values_at(1, 3, 5, 7).any?{ |i| i == " " }
          edges.sample
        else
          move_arr.sample
        end
      elsif self.token == "O"
        if board.cells[4] == " "
          "5"
        elsif board.cells.values_at(0, 2, 6, 8).any?{ |i| i == " " }
          corners.sample
        elsif board.cells.values_at(1, 3, 5, 7).any?{ |i| i == " " }
          edges.sample
        else
          move_arr.sample
        end
      end
    end
  end
end

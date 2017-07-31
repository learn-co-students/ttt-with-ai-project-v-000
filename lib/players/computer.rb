module Players
  class Computer < Player
    attr_accessor :board

  #create a CONSTANT array to contain all possible win combos
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board)
      move = nil
      if !board.taken?(4)
        move = "5"
      elsif !board.taken?(0)
        move = "1"
      else move = [0,2,3,4,7,8].detect {|open| !board.taken?(open)}.to_s
        move = open.to_s
      #else board.cells.detect {|open| open == " "}
      #  input = open.to_s
      end
    end

  end
end

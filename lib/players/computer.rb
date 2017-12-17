module Players
  class Computer < Player

    def move(board)
      _, index = board.cells.each_with_index.detect {|x,i| x != "X" && x != "O"  }
      (index + 1).to_s
    end
  end
end
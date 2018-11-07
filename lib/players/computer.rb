module Players

  class Computer < Player

    def move(board)
      choices = []
      board.cells.each_with_index {|c,i| choices << i if c == " "}
      (choices.sample + 1).to_s
    end

  end

end

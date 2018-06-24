module Players

  class Computer < Player

    # HMMMM!

    # simple logic:

    # def move(board)
    #   "1"
    # end

    def open_positions(board)
      @open = []
      board.cells.each_with_index { |cell, index| @open << (index + 1).to_s if cell == " "}
      @open
    end

    def move(board)
      positions = open_positions(board)
      @move = positions[0]
      @move
    end
  end
end

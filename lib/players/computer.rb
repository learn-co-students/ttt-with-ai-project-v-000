module Players
  class Computer < Player
    def move(board)
      temp = Board.new
      temp.cells = board

      #dev
      board.index{" "}
    end
  end
end

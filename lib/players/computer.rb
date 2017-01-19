module Players
  class Computer < Player
    def move(board)
      temp = Board.new
      temp.cells = board

      #dev
      (board.index(" ") + 1).to_s
    end
  end
end

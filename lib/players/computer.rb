module Players
  class Computer < Player

    def move(board)
      # temporarily brute-forces a choice
      selected = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      move(board) if !board.valid_move?(selected)
      selected
    end
  end
end
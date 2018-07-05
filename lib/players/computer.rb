module Players
  class Computer < Player

    def move(board)
      !board.taken?('5') ? '5' : (board) + 1
    end
  end
end

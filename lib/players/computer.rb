module Players
  class Computer < Player
    def move(board)
      if !board.taken?(5)
        move = "5"
      end
    end
  end
end

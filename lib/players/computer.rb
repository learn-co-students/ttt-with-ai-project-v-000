module Players
  class Computer < Player
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      end
      move
    end
  end
end

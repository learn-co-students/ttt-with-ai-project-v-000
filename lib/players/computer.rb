module Players
  class Computer < Player

    def move(board)
      move = 1 + rand(10)
      move.to_s
    end
  end
end

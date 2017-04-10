module Players
  class Computer < Player

    def move(board)
      move = (1..9).to_a
      move.sample.to_s
    end

  end
end

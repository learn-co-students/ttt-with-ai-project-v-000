module Players
  class Computer < Player
    def move(board)
      (1..9).to_a.sample.to_s
    end
  end
end

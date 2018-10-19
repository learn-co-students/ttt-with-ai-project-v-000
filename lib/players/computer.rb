module Players
  class Computer < Player
    def move(board)
      [*1..9].join(" ").split.sample
    end
  end
end

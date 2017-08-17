module Players
  class Computer < Player
    def move(board)
      [*1..9].sample.to_s
    end
  end
end

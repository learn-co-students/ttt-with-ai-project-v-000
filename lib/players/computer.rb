module Players
  class Computer < Player

    def move(_board)
      ["1", "2", "3", "4", "5", "6", "7", "8", "9"].shuffle.first
    end

    def guess(board)
      Random.rand(8)
    end

  end # class Computer
end # module Players

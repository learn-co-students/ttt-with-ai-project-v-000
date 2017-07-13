module Players
  class Computer < Player
    def move(board)
      num = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      num.sample
    end
  end
end

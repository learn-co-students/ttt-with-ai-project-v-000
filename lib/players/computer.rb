module Players
  class Computer < Player
    def move(ary)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      pos = rand(8)
      val = valid_moves[pos]
      valid_moves.delete(val)
      val
    end
  end
end
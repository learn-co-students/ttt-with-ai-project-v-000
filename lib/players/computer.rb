module Players
  class Computer < Player
    def move(board)
      i = 4
      ai = 0
      while board.taken?(i+1)
        i += 2
        if i >= 10
          i = 0
          ai += 1
        end
        if i == 0 && ai == 2
          i += 1
        end
      end
      i += 1
      return i.to_s
    end
  end
end

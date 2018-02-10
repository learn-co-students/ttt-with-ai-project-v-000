module Players
  class Computer < Player
    def move(board)
      a = rand(9)
      a -= 1
      a.to_s
    end
  end
end

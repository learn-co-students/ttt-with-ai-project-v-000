module Players
  class Computer < Player
    def move(board)
      num = rand(1..9)
      if board.taken?(num) == false
        num.to_s
      else
        move(board)
      end
    end
  end
end

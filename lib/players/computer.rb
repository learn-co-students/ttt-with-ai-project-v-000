module Players

  class Computer < Player

    def move(board)

      (1..9).detect{|i| !board.taken?(i)}.to_s
    end
  end

end

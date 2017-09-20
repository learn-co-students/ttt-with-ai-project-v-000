module Players
  class Computer < Player
    def move(board)
      if board.empty?
        ["1","3","7","9"].sample
      elsif !board.taken?(5)
          move = "5"
      else
          Random.rand(1..9).to_s
      end
    end
  end
end

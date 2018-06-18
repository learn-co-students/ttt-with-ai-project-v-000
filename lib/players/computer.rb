module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        binding.pry
        1
      elsif board.turn_count == 1
        if !board.taken?(5)
          5
        elsif board.taken?(5)
          corners
        end
      elsif board.turn_count == 2
        9 unless board.taken?(9)
        corners
      elsif board.turn_count == 3
        edges
      else
        (rand(9) + 1).to_s
      end
    end

    def corners
      1 unless taken?(1)
      3 unless taken?(3)
      7 unless taken?(7)
      9 unless taken?(9)
    end

    def edges
      2 unless taken?(2)
      4 unless taken?(4)
      6 unless taken?(6)
      8 unless taken?(8)
    end

  end
end

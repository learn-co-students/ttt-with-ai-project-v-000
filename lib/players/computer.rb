module Players
  class Computer < Player

    def move(board)
      #corners
      #middle
      (rand(9) + 1).to_s
    end

    def corners
      0 unless taken?
      2 unless taken?
      6 unless taken?
      8 unless taken?
    end

    def middle
      4
    end

  end
end

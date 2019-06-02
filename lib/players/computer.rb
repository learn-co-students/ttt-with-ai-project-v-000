module Players
  class Computer < Player

    def move(board)
      if !board.taken?(5)
        "5"
      elsif board.turn_count == 1
        "1"
      end
    end


  end
end

module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        "4"
      else
        "2"
      end
    end

  end
end

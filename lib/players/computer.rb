module Players
  class Computer < Player

    def move(board)
      i = 0
      until board.valid_move?(i)
        i += 1
      end
      i.to_s
    end

    def open_the_podbay_doors_hal
      "I'm sorry Dave. I'm afraid I can't do that."
    end

  end
end

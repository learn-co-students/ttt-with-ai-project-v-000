module Players
  class Computer < Player

    def move(board)
      puts "Beep Borp! Making Moves *crackle*"
      i = 0
      until board.valid_move?(i)
        i = rand(1..9)
      end
      i.to_s
    end

    def open_the_podbay_doors_hal
      "I'm sorry Dave. I'm afraid I can't do that."
    end

  end
end

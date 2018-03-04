module Players
  class Computer < Player

    def move(board)


      if !board.taken?(9)
        "9"
      elsif !board.taken?(1)
        "1"
      elsif !board.taken?(3)
        "3"
      elsif !board.taken?(6)
        "6"
      elsif !board.taken?(2)
        "2"
      elsif !board.taken?(7)
        "7"
      elsif !board.taken?(8)
        "8"
      elsif !board.taken?(4)
        "4"
      elsif !board.taken?(5)
        "5"
      end
    end
  end
end

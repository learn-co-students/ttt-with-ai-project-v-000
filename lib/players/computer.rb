module Players
  class Computer < Player
    def move(board)
      spot = nil
      if !board.taken?(1)
        spot = "1"
      elsif !board.taken?(2)
        spot = "2"
      elsif !board.taken?(3)
        spot = "3"
      elsif !board.taken?(4)
        spot = "4"
      elsif !board.taken?(5)
        spot = "5"
      elsif !board.taken?(6)
        spot = "6"
      elsif !board.taken?(7)
        spot = "7"
      elsif !board.taken?(8)
        spot = "8"
      elsif !board.taken?(9)
        spot = "9"
      end
    end
  end
end

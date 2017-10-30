module Players

  class Computer < Player
    def move(board)
      if board.valid_move?(5)
        spot = "5"
      elsif board.valid_move?(1)
        spot = "1"
      elsif board.valid_move?(3)
        spot = "3"
      elsif board.valid_move?(7)
        spot = "7"
      elsif board.valid_move?(9)
        spot = "9"
      elsif board.valid_move?(2)
        spot = "2"
      elsif board.valid_move?(4)
        spot = "4"
      elsif board.valid_move?(6)
        spot = "6"
      elsif board.valid_move?(8)
        spot = "8"
      end
      spot
    end
  end
end

module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(4)
        place = "4"
      elsif board.valid_move?(2)
        place = "2"
      elsif board.valid_move?(6)
        place = "6"
      elsif board.valid_move?(8)
        place = "8"
      elsif board.valid_move?(1)
        place = "1"
      elsif board.valid_move?(3)
        place = "3"
      elsif board.valid_move?(5)
        place = "5"
      elsif board.valid_move?(7)
        place = "7"
      elsif board.valid_move?(9)
        place = "9"
      end
      place
    end
  end
end

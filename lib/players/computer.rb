module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(1)
        then "1"
      elsif board.valid_move?(2)
        then "2"
      elsif board.valid_move?(3)
        then "3"
      elsif board.valid_move?(4)
        then "4"
      elsif board.valid_move?(5)
        then "5"
      elsif board.valid_move?(6)
        then "6"
      elsif board.valid_move?(7)
        then "7"
      elsif board.valid_move?(8)
        then "8"
      elsif board.valid_move?(9)
        then "9"
      end
    end
  end
end

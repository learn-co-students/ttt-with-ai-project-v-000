module Players
  class Computer < Player
    def move(board)
      if board.valid_move?(5)
        "5"
      elsif !board.valid_move?(5)
        [1,3,4,6,7,9].sample.to_s
      else
        [*1..9].sample.to_s
      end
    end
  end
end

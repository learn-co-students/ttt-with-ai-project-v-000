module Players
  class Computer < Player

    def move(board)
      reply = rand(1-9).to_s
      if board.valid_move?(reply)
        reply
      elsif board.valid_move?(reply)
        "invalid"
      elsif board.taken?(1) && board.taken?(2)
        "3"
      elsif board.taken?(4) && board.taken?(5)
        "6"
      elsif board.taken?(7) && board.taken?(8)
        "9"
      elsif board.taken?(4) && board.taken?(5)
        "5"
      end
    end
  end
end

module Players

  class Computer < Player

    def move (board)
      valid_moves = ("1".."9").to_a
      computer_move = valid_moves[4]

    end
  end
end

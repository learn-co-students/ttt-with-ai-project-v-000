module Players
  class Computer < Player

    def move(board)
      the_move = rand(1..9)

      if board.valid_move?(the_move)
        the_move.to_s
      end
    end
  end
end
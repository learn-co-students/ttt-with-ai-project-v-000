module Players

  class Computer < Player

    def rand_moves(board)
      rand_move = rand(1...10)
      until board.valid_move?(rand_move)
        rand_move = rand(1...10)
      end
      puts rand_move
      rand_move.to_s
    end

    def move(board)
      if board.valid_move?(5)
        5
      elsif board.valid_move?(1)
        1
      elsif board.valid_move?(3)
        3
      else
        rand_moves(board)
      end

    end

  end

end

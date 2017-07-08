module Players

  class Computer < Player

    def move(board)
      rand_move = rand(1...10)
      until board.valid_move?(rand_move)
        rand_move = rand(1...10)
      end
      puts rand_move
      rand_move.to_s
    end

  end

end

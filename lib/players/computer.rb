
module Players

  class Computer < Player

    def move (board)
      comp_play = rand(1...10).to_s
      while (board.valid_move?(comp_play) == false)
        comp_play = rand(1...10).to_s
      end
      comp_play
    end

  end

end
